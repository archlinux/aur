# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=gwe
pkgver=0.8.0
pkgrel=1
pkgdesc="A system utility for controlling NVIDIA GPUs"
arch=('any')
url="https://gitlab.com/leinardi/gwe"
license=('GPL3')
depends=('libdazzle' 'libappindicator3' 'python' 'python-cairo' 'python-gobject' 'python-injector' 'python-matplotlib' 'python-peewee' 'python-py3nvml' 'python-requests' 'python-rx' 'python-xdg')
makedepends=('meson')
provides=()
source=("https://gitlab.com/leinardi/gwe/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e5f73946ae4d6c6997cfc60f838e945a273dd690b4ea1291612ffc92ffd2debb')

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
