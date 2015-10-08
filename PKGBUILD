# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=sslsplit-git
pkgver=0.4.11.321.22b4d3c
pkgrel=1
pkgdesc="Tool for man-in-the-middle attacks against SSL/TLS encrypted network connections"
url="https://www.roe.ch/SSLsplit"
arch=('i686' 'x86_64')
license=('BSD')
depends=('libevent' 'openssl')
makedepends=('git')
checkdepends=('check')
provides=('sslsplit')
conflicts=('sslsplit')
source=(${pkgname}::git+https://github.com/droe/sslsplit)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  make
}

check() {
  cd ${pkgname}
  make -j1 test
}

package() {
  cd ${pkgname}
  make PREFIX="${pkgdir}/usr" install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 NEWS.md "${pkgdir}/usr/share/doc/${pkgname}/NEWS.md"
}

# vim: ts=2 sw=2 et:
