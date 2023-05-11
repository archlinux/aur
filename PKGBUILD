# Maintainer: Will Elliott <troutcobbler@gmail.com>

pkgname=goober
pkgver=0.1.2
pkgrel=3
pkgdesc="Workspace module generator for eww."
url='https://bitbucket.org/troutcobbler/goober'
arch=(x86_64)
license=(MIT)
makedepends=(go git)
depends=(eww)
install=goober.install
source=("git+${url}#tag=${pkgver}")
b2sums=('SKIP')

build() {
  cd "$pkgname"
  go build -trimpath -buildmode=pie -mod=readonly -ldflags "-s -w" .
}

package() {
  cd "$pkgname"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 doc/eww/* -t "${pkgdir}/usr/share/doc/${pkgname}/eww"
  install -Dm644 doc/eww-wayland/* -t "${pkgdir}/usr/share/doc/${pkgname}/eww-wayland"
  install -Dm644 doc/goober.conf -t "${pkgdir}/usr/share/doc/${pkgname}"
}
