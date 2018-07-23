# Maintainer: Robert Stoffers <rstoffers@gmail.com>

pkgname=gamehub
pkgver=0.5.7
pkgrel=2
pkgdesc="Games manager/downloader/library written in Vala that supports GOG, Steam and Humble Bundle"
arch=('any')
url="https://github.com/tkashkin/GameHub"
license=('unknown')
depends=('granite' 'gtk3' 'glibc' 'webkit2gtk' 'json-glib' 'libgee' 'libsoup' 'sqlite' 'gdk-pixbuf2' 'cairo')
makedepends=('meson' 'ninja' 'vala')
conflicts=('gamehub-git')
source=("GameHub-$pkgver.tar.gz"::https://github.com/tkashkin/GameHub/archive/0.5.7.tar.gz)
md5sums=('ea8ab308917b91a25c72a39d17b4c860') 

build() {
	cd "GameHub-$pkgver"
	meson build --prefix=$pkgdir/usr -Ddistro=arch
	cd build
	ninja
	rm -f ../meson/post_install.py # don't do post install to avoid generating unnecessary files
	touch ../meson/post_install.py # menson chucks a wobbly if it doesn't exist
}

package() {
	cd "GameHub-$pkgver"/build
	ninja install
}
