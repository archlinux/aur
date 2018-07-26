# Maintainer: Robert Stoffers <rstoffers@gmail.com>

pkgname=gamehub
pkgver=0.6.2
pkgrel=1
pkgdesc="Games manager/downloader/library written in Vala that supports GOG, Steam and Humble Bundle"
arch=('any')
url="https://github.com/tkashkin/GameHub"
license=('unknown')
depends=('granite' 'gtk3' 'glibc' 'webkit2gtk' 'json-glib' 'libgee' 'libsoup' 'sqlite' 'gdk-pixbuf2' 'cairo')
makedepends=('meson' 'ninja' 'vala')
conflicts=('gamehub-git')
source=("GameHub-$pkgver.tar.gz"::https://github.com/tkashkin/GameHub/archive/$pkgver.tar.gz)
md5sums=('15f58636acd5946185fbca1c65a6a17c') 

build() {
	cd "GameHub-$pkgver"
	meson build --prefix=/usr -Ddistro=arch
	cd build
	ninja
}

package() {
	cd "GameHub-$pkgver"/build
	DESTDIR=$pkgdir ninja install
	sudo ln -s /usr/bin/com.github.tkashkin.gamehub /usr/bin/gamehub
}
