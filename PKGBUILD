# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=libpam-x2go
pkgver=0.0.2.0
pkgrel=1
pkgdesc="Arctica Greeter: Remote logon support for X2Go (PAM module)"
arch=(x86_64)
url="https://github.com/ArcticaProject/libpam-x2go"
license=('GPL3')
depends=(pam libssh)
makedepends=(libssh x2goserver)
options=(!libtool !staticlibs !emptydirs)
source=("https://github.com/ArcticaProject/"$pkgname"/archive/"$pkgver".tar.gz")
md5sums=('48d7752172deb9c45089584de9084c47')

build() {
	cd "$pkgname-$pkgver"
  aclocal --install
  autoreconf -vfi
	./configure --prefix=/usr --libexec=/usr/lib --libdir=/usr/lib 
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
  mv $pkgdir/lib/security $pkgdir/usr/lib/
}
