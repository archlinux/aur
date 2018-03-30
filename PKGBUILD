# Maintainer: Patrick Hanft <mail@patrick-hanft.de>
pkgname=openfortivpn
pkgver=1.6.0
pkgrel=2
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
source=("git+https://github.com/adrienverge/$pkgname.git#tag=v$pkgver" "allow-no-unused-functions.patch" "use-otp-for-2fa.patch")
noextract=()
md5sums=('SKIP'
         'cb2d5a8b3f799ec3d0267722f0a0206b'
	 '039b464ef44a7c9e13130f938e5fc255')

prepare() {
 cd "$srcdir/$pkgname"
 patch -Np0 -i "${srcdir}/allow-no-unused-functions.patch"
 patch -Np0 -i "${srcdir}/use-otp-for-2fa.patch"
}

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

