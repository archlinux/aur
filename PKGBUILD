# Maintainer: Robert Stoffers <rstoffers@gmail.com>

pkgname=gamehub
pkgver=0.6.1
pkgrel=1
pkgdesc="Games manager/downloader/library written in Vala that supports GOG, Steam and Humble Bundle"
arch=('any')
url="https://github.com/tkashkin/GameHub"
license=('unknown')
depends=('granite' 'gtk3' 'glibc' 'webkit2gtk' 'json-glib' 'libgee' 'libsoup' 'sqlite' 'gdk-pixbuf2' 'cairo')
makedepends=('meson' 'ninja' 'vala')
conflicts=('gamehub-git')
source=("GameHub-$pkgver.tar.gz"::https://github.com/tkashkin/GameHub/archive/$pkgver.tar.gz)
md5sums=('98082a10b95208035c24fd1eb52fa3c8') 

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
