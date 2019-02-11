# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=gwe
pkgver=0.11.0
pkgrel=1
pkgdesc="A system utility for controlling NVIDIA GPUs"
arch=('any')
url="https://gitlab.com/leinardi/gwe"
license=('GPL3')
depends=('gobject-introspection' 'libdazzle' 'libappindicator3' 'python' 'python-cairo' 'python-gobject' 'python-injector' 'python-matplotlib' 'python-peewee' 'python-py3nvml' 'python-requests' 'python-rx' 'python-xdg')
makedepends=('meson')
provides=()
_xlib_commit='73b66f94d7c359fab4246548f8505750cabb68a4'
source=("https://gitlab.com/leinardi/gwe/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/leinardi/python-xlib/archive/${_xlib_commit}.tar.gz")
sha256sums=('c7c450e3abcc8d33a46dae2cc101c21b2df19b552dcdaf0897f97fb0092c6f6b'
            'fa70f72b7f075942c50ba3209b4b36b577c21b48a18e9d93f3fba938b169a2a6')

prepare() {
	rmdir "$pkgname-$pkgver/python-xlib"
	ln -s "../python-xlib-${_xlib_commit}" "$pkgname-$pkgver/python-xlib"
}

build() {
	meson --prefix /usr --buildtype=plain "$pkgname-$pkgver" build
	ninja -C build
}

check() {
	ninja -C build test
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
