# Maintainer: karwler <karwler@horsefucker.org>
pkgname='sfbrename-cli'
_pkgname='sfbrename'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='Simple bulk rename utility (CLI tool)'
arch=('x86_64')
url='https://github.com/karwler/sfbrename'
license=('custom')
depends=('glib2')
makedepends=('cmake' 'gcc' 'git' 'make')
provides=("$_pkgname")
conflicts=("$_pkgname-gtk")
source=("$_pkgname::git+https://github.com/karwler/sfbrename.git#tag=70d9967d46b209ac1247cb863bfbb42f0549213f")
sha256sums=('SKIP')

prepare() {
	sed -i 's/Exec=usr/Exec=\/usr/;s/Icon=sfbrename/Icon=\/usr\/share\/sfbrename\/sfbrename.png/' "$srcdir/$_pkgname/rsc/$_pkgname.desktop"
}

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --tags | sed 's/^v//'
}

build() {
	cd "$srcdir/$_pkgname"
	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=gcc -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCONSOLE=1
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make install
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
