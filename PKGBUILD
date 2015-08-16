pkgname=livewallpaper
pkgver=0.4.1
pkgrel=2
pkgdesc="OpenGL powered animated wallpapers with configuration utility, autostart, and application indicator."
arch=(any)
url="https://launchpad.net/livewallpaper"
license=('GPL3')
depends=('libgl' 'gtk3' 'libpeas' 'libx11' 'python-cairo' 'python-opengl')
makedepends=('intltool' 'xcftools')
provides=('livewallpaper' 'livewallpaper-indicator' 'livewallpaper-config')
source=(https://launchpad.net/livewallpaper/0.4/0.4.1/+download/livewallpaper-0.4.1.tar.gz)
sha256sums=(9b1e386ce0aa0547d8ac9938a8d3f211cffd8b38496bf1972a99455d94bd2de6)
install=livewallpaper.install

build() {
	cd "$srcdir/$pkgname-$pkgver/cmake"
	sed -i "s/set(LIVEWALLPAPER_REQUIRES\
/&\n\tx11/" ../CMakeLists.txt
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../
}

package() {
	cd "$srcdir/$pkgname-$pkgver/cmake"
	make DESTDIR="$pkgdir/" install
}
