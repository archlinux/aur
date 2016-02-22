# Maintainer: Salamandar <felix@piedallu.me>

pkgname=livewallpaper
pkgver=0.5.0
pkgrel=1
pkgdesc="OpenGL powered animated wallpapers with configuration utility, autostart, and application indicator."
arch=(any)
url="https://launchpad.net/livewallpaper"
license=('GPL3')
makedepends=('intltool' 'xcftools' 'cmake')
depends=('libgl' 'libpeas' 'libx11'
        'python' 'python-numpy' 'python-cairo' 'python-opengl'
        'gtk3' 'gobject-introspection' 'libappindicator-gtk3')

provides=('livewallpaper' 'livewallpaper-indicator' 'livewallpaper-config')
source=(https://launchpad.net/livewallpaper/0.5/0.5.0/+download/livewallpaper-0.5.0.tar.gz)
sha256sums=('f4ce97a721015b135eb675915eb306c1fb256e680d480fe13e4fe6ca81c7e04e')
install=livewallpaper.install

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i '/add_subdirectory(debian)/d' CMakeLists.txt
}

build() {
	cd "$srcdir/$pkgname-$pkgver/cmake"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../
    make DESTDIR="$pkgdir/"
}

package() {
	cd "$srcdir/$pkgname-$pkgver/cmake"
	make DESTDIR="$pkgdir/" install
}
