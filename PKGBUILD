# Maintainer: Young Acinonyx <young.acinonyx [at] gmail [dot] com>>

pkgname=kodi-addon-vfs-libarchive-git
_pkgname=vfs.libarchive
pkgver=r201.44acd30
pkgrel=1
pkgdesc="Kodi VFS addon to support archives. Git version."
arch=('x86_64')
url='https://github.com/xbmc/vfs.libarchive'
license=('GPL2')
groups=('kodi-addons')
depends=('kodi')
makedepends=('cmake' 'kodi-dev' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/xbmc/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
        cd "${srcdir}/${pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
	.
    make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}
