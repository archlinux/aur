# Maintainer: asmeron <asmeron@ublinux.ru>

pkgname=mkpasswd2-git
pkgver=5.5.13
pkgrel=1
pkgdesc="The mkpasswd2 by Marco d'Itr, 'whois' project"
arch=('i686' 'x86_64')
url="https://github.com/rfc1036/whois"
license=('GPL2')
depends=('glibc' 'libxcrypt')
makedepends=('git' 'perl' 'libidn2')
provides=('mkpasswd2')
conflicts=('mkpasswd' 'debian-whois-mkpasswd')
source=("git+${url}.git#branch=next")
sha256sums=('SKIP')

pkgver() {
    cd "whois"
    git describe --long --tags | sed 's/^v//;s/-.*//g'
}

build() {
    cd "whois"
    make \
	CFLAGS="$CFLAGS $CPPFLAGS" \
	prefix="/usr" \
	LOCALEDIR=1 \
	HAVE_ICONV=1
}

package() {
    cd "whois"
    make \
	BASEDIR="$pkgdir" \
	prefix="/usr" \
	install-mkpasswd \
	install-pos
    mv $pkgdir/usr/bin/mkpasswd $pkgdir/usr/bin/mkpasswd2
    mv $pkgdir/usr/share/man/man1/mkpasswd.1 $pkgdir/usr/share/man/man1/mkpasswd2.1
}
