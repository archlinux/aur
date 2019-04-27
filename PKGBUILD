# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xplayer-plparser-git
_pkgbasename=xplayer-plparser
pkgver=master.lmde3.r0.g600ec3d
pkgrel=1
pkgdesc="Playlist parser for xplayer. X-Apps Project (git version)."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('gmime' 'libsoup' 'libarchive' 'libquvi')
makedepends=('git' 'meson' 'gtk-doc' 'gobject-introspection')
provides=($pkgname $_pkgbasename)
conflicts=("${_pkgbasename}")
url='https://github.com/linuxmint/xplayer-plparser'

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p "${srcdir}/${pkgname}/build"
    cd "${srcdir}/${pkgname}/build"

    meson --prefix=/usr \
          --libexecdir=lib/${pkgname} \
          --buildtype=plain \
          ..
    ninja
}

package(){
    cd ${srcdir}/${pkgname}/build
    DESTDIR="$pkgdir/" ninja install
}
