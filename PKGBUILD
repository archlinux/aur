# Contributor: Henrik Hallberg <henrik@k2h.se>

pkgname=pvpn
pkgver=0.2.1.r11.g7b93132
pkgrel=1
pkgdesc="VPN over SSH"
arch=('any')
url="https://github.com/halhen/pvpn"
license=('BSD')
depends=('iproute2' 'openssh' 'bind' 'ppp')
makedepends=('git' 'asciidoc')
source=('git+https://github.com/takeshixx/pvpn.git')
md5sums=('SKIP')


pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  PREFIX="/usr" make
}

package() {
  cd "$pkgname"
  make PREFIX="/usr" MANPREFIX="/usr/share/man/" DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
