# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=godo
pkgver=2.0.9
pkgrel=1
pkgdesc="Task runner and file watcher for golang in the spirit of rake, gulp"
# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=godo
pkgver=2.0.9
pkgrel=1
pkgdesc="Task runner and file watcher for golang in the spirit of rake, gulp"
arch=('i686' 'x86_64')
url="https://github.com/go-godo/${pkgname}"
license=('MIT')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/go-godo/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7ba11bec0de3404b3d4317e3d66fdbab013e7677150e6e0200c451d667385a85')

prepare() {
  mkdir -p "${srcdir}/src/github.com/go-godo/"
  mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/go-godo/${pkgname}"
}

build() {
  cd "${srcdir}/src/github.com/go-godo/${pkgname}"
  GOPATH="${srcdir}"
  go get -d ./cmd/${pkgname}
  go build ./cmd/${pkgname}
}

package() {
  cd "${srcdir}/src/github.com/go-godo/${pkgname}"
  install -Dm755 godo "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sts=2 sw=2 et:
