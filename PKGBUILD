# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=gwe
pkgver=0.9.0
pkgrel=1
pkgdesc="A system utility for controlling NVIDIA GPUs"
arch=('any')
url="https://gitlab.com/leinardi/gwe"
license=('GPL3')
depends=('libdazzle' 'libappindicator3' 'python' 'python-cairo' 'python-gobject' 'python-injector' 'python-matplotlib' 'python-peewee' 'python-py3nvml' 'python-requests' 'python-rx' 'python-xdg')
makedepends=('meson')
provides=()
_xlib_commit='67ef8a5b3951396752746d7e103500d098ec1bf1'
source=("https://gitlab.com/leinardi/gwe/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/leinardi/python-xlib/archive/${_xlib_commit}.tar.gz")
sha256sums=('bac956838702db1d367b449b8c8a70973c7204bca5d88098434124235eee5fba'
            '800e1c1b382dfb67aaac4c4d2565e5edd0851e9e49b2cb06bc17c354f2027abd')

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
