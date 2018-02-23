# Maintainer: Tobias Martin <tm-x at gmx dot net>

pkgname=fritzctl
pkgver=1.4.19
pkgrel=1
pkgdesc="A lightweight, easy to use console client for the AVM FRITZ!Box Home Automation."
arch=('x86_64')
url="https://github.com/bpicode/fritzctl"
license=('MIT')
makedepends=('go')
options=('!strip')
source=("https://github.com/bpicode/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6bc48a08f3dc258d9c2acf68e7dd63e9e6808f37297fd02401bee1772a53cbbe')

prepare() {
  mkdir -p "${srcdir}/src/github.com/bpicode/"
  mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/bpicode/${pkgname}"
}

build() {
  cd "${srcdir}/src/github.com/bpicode/${pkgname}"
  GOPATH="${srcdir}" go build
}

package() {
  cd "${srcdir}/src/github.com/bpicode/${pkgname}"

  mkdir -p "$pkgdir/etc/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
