# Maintainer: Sabu Siyad <ssiyad at disroot.org>
# This PKGBUILD is maintained at https://github.com/ssiyad/pkgbuilds/

# Contributor: Dmitri Goutnik <dg@syrec.org>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=2fa
pkgver=1.2.0
pkgrel=1
pkgdesc="Two factor authentication agent"
arch=('x86_64')
url='https://github.com/rsc/2fa'
license=('BSD')
makedepends=('go')
conflicts=('2fa-git')
replaces=('2fa-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("SKIP")

prepare() {
  mkdir -p src/rsc.io
  mv ${pkgname}-${pkgver} src/rsc.io/2fa
}

build() {
  cd src/rsc.io/2fa
  env GOPATH="${srcdir}" go mod vendor && go build
}

# check() {
#   cd src/rsc.io/2fa
#   env GOPATH="${srcdir}" go test
# }

package() {
  cd src/rsc.io/2fa
  install -Dm755 2fa "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
