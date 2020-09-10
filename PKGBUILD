# Maintainer: Jonas Röger <jonas.roeger@gmail.com>
pkgname=xrootgif
pkgver=1.5.1
pkgrel=1
pkgdesc="A simple program for setting animated wallpapers, targeting performance"
arch=('x86_64')
url="https://github.com/jroeger23/XRootGIF"
license=('custom:MIT')
depends=('libx11' 'giflib' 'imlib2')
makedepends=('gcc' 'meson' 'ninja')
optdepends=('libxrandr: multi monitor support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('e681e84c99b49ddaf75004e50c7518f105cd91419a239c77b5110fa26df9953bea827c38b11524eaac65e0015ea5f12749176567276d36db56c1b59e81c92ec8')

prepare() {
	local _realname="XRootGIF"
	cd $srcdir/$_realname-$pkgver
	patch -p1 -i "../../$pkgname-$pkgver-aur.patch"
	meson --prefix=$pkgdir/usr build
}

build() {
	local _realname="XRootGIF"
	cd $srcdir/$_realname-$pkgver/build
	ninja
}

package() {
	local _realname="XRootGIF"
	cd $srcdir/$_realname-$pkgver/build
	ninja install
}
