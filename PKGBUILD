# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname=modmanager
pkgver=1.1.0
pkgrel=2
pkgdesc="A Qt-based mod manager for minecraft."
arch=(x86_64)
url="https://github.com/kaniol-lck/modmanager"
license=('GPL')
groups=()
depends=(qt5-base aria2 quazip hicolor-icon-theme)
makedepends=('qt5-tools')
provides=(modmanager-git)
conflicts=(modmanager-git)
replaces=()
backup=()
options=()
install=
source=("modmanager-$pkgver.zip::https://github.com/kaniol-lck/modmanager/archive/refs/tags/v$pkgver.zip"
"1.1.0-quazip-1.3.patch")
noextract=()
md5sums=('150e18a3fa90154893904affc16cbfb2'
         'b26a3cd2e0852dc818b564253b79bcdf')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/1.1.0-quazip-1.3.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	qmake
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
