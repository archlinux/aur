# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=libpam-freerdp2
pkgver=2.0.0
pkgrel=1
pkgdesc="Arctica Greeter: Remote logon support for freerdp (PAM module)"
arch=(x86_64)
url="https://github.com/ArcticaProject/libpam-x2go"
license=('GPL3')
depends=(pam freerdp)
makedepends=(mate-common freerdp)
options=(!libtool !staticlibs !emptydirs)
source=("https://github.com/ArcticaProject/"$pkgname"/archive/"$pkgver".tar.gz")
md5sums=('2cfc9a8fd6275e27ff8a284769675652')

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
