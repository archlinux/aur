# Maintainer: Mistle <tehmistle [at] gmx.com>
pkgname=vr2normal
pkgver=1.3
pkgrel=1
pkgdesc="C++ QT Program that converts virtual reality videos into normal videos for viewing on any screen"
arch=('x86_64')
url="https://gitlab.com/vongooB9/vr2normal"
license=('GPL3')
depends=('ffmpeg>=5.0' 'qt5-base>=5.15.0')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
"0001-Fix-Linux-packaging-with-correctly-set-target.path.patch"
)
sha256sums=('2eab584e87d0d533347f4c498d237b3b08b5c59b6ef16343801c54497db1fcd7'
            'e0ae9e79fdf2140df22045b10ee7417eb18e7250151b02a3e819e96eff1edb5d')

prepare() {
	cd "$pkgname-$pkgver"
	patch -Np1 -i "$srcdir/0001-Fix-Linux-packaging-with-correctly-set-target.path.patch"
}

build() {
	cd "$pkgname-$pkgver"
	PREFIX=/usr qmake-qt5
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
