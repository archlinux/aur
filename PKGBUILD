# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=gwe
pkgver=0.13.0
pkgrel=1
pkgdesc="A system utility for controlling NVIDIA GPUs"
arch=('any')
url="https://gitlab.com/leinardi/gwe"
license=('GPL3')
depends=('gobject-introspection' 'libdazzle' 'libappindicator3' 'python' 'python-cairo' 'python-gobject' 'python-injector' 'python-matplotlib' 'python-peewee' 'python-py3nvml' 'python-requests' 'python-rx' 'python-xdg')
makedepends=('meson' 'appstream-glib')
provides=()
_xlib_commit='52e6cd2a78c32fa7d78dc73795628c78ff7b970b'
source=("https://gitlab.com/leinardi/gwe/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/leinardi/python-xlib/archive/${_xlib_commit}.tar.gz")
sha256sums=('90a1140f50281b3a7e65f145b820f60adf47d966426087583c10282c65240193'
            '20f3696205918978c6d3bb214a282606064b52c9c90b781cb5862452a8f4ef42')

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
