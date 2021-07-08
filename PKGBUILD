# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=rhtvision
_name=tvision
pkgver=2.2.3
pkgrel=1
pkgdesc="A multi-platform TUI from the 90s"
arch=('x86_64')
url="https://github.com/set-soft/tvision"
license=('GPL')
depends=('gpm' 'gcc-libs' 'libxmu')
provides=("$_name")
conflicts=("$_name")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f913ac266e7bfb2744f57a4e645131e0e699108d8721b66d82ff184a443a97a5')

build() {
	cd "$_name-$pkgver/$_name/"
	export CXXFLAGS+=' -std=gnu++98'
	PERL_USE_UNSAFE_INC=1 ./configure --prefix=/usr --include=/usr/include
	make LDFLAGS=$LDFLAGS
}

package() {
	cd "$_name-$pkgver/$_name/"
	make prefix="$pkgdir/usr" install
}
