# Maintainer: Patrick Hanft <mail@patrick-hanft.de>
pkgname=openfortivpn
pkgver=1.3.0
pkgrel=1
pkgdesc="An open implementation of Fortinet's proprietary PPP+SSL VPN solution"
arch=('i686' 'x86_64')
url="https://github.com/adrienverge/openfortivpn"
license=('GPL3')
groups=()
depends=('openssl' 'ppp')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=()
conflicts=()
replaces=()
backup=('etc/openfortivpn/config')
options=()
install=
source=("git+https://github.com/adrienverge/$pkgname.git#tag=v$pkgver")
noextract=()
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	aclocal
	autoconf
	automake --add-missing
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

check() {
	cd "$srcdir/$pkgname"
	make -k check
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}

