# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=whois-git
pkgver=5.2.18.r0.g5dd942b
pkgrel=2
pkgdesc="The whois client by Marco d'Itri"
arch=('i686' 'x86_64')
url="https://github.com/rfc1036/whois"
license=('GPL2')
depends=('glibc' 'libidn2')
makedepends=('git' 'perl')
provides=('whois')
conflicts=('whois')
backup=('etc/whois.conf')
source=("git+https://github.com/rfc1036/whois.git#branch=next")
sha256sums=('SKIP')


pkgver() {
  cd "whois"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "whois"

  make CFLAGS="$CFLAGS $CPPFLAGS" prefix="/usr" \
    CONFIG_FILE=/etc/whois.conf \
    LOCALEDIR=1 \
    HAVE_LIBIDN=1 HAVE_ICONV=1
}

package() {
  cd "whois"

  make BASEDIR="$pkgdir" prefix="/usr" install-whois install-pos
  install -Dm644 "whois.conf" "$pkgdir/etc/whois.conf"
}
