# Maintainer: Vagios Vlachos <bagios234 at gmail dot com>

pkgname=kodi-addon-vfs-libarchive-leia
_gitname=vfs.libarchive
pkgver=1.0.7
_kodiversion=Leia
pkgrel=1
pkgdesc="VFS libarchive addon for Kodi Leia"
arch=('x86_64')
url="https://github.com/xbmc/vfs.libarchive"
license=('GPL')
groups=('kodi-addons')
provides=() 
makedepends=('cmake' 'kodi-dev>=18' 'kodi-dev<19' 'git')
depends=('kodi>=18' 'kodi<19')
source=("${_gitname}-${pkgver}-${_kodiversion}.tar.gz::https://github.com/xbmc/vfs.libarchive/archive/${pkgver}-${_kodiversion}.tar.gz")
md5sums=('398705c272cba3016b455e79b153fb03')

_prefix='/usr'

build() {
	cd "$srcdir/$_gitname-$pkgver-$_kodiversion"
	mkdir -p build && pushd build
	cmake -DCMAKE_INSTALL_PREFIX=$_prefix \
		-DCMAKE_BUILD_TYPE=Release \
		..
	make
	popd
}

package() {
	cd "$srcdir/$_gitname-$pkgver-$_kodiversion/build"
	make DESTDIR="$pkgdir/" install
}
