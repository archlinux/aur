# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xplayer-plparser
pkgver=1.0.3
pkgrel=1
pkgdesc="Playlist parser for xplayer. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('gmime3' 'libsoup' 'libarchive' 'libquvi')
makedepends=('meson' 'gtk-doc' 'gobject-introspection')
provides=($pkgname)
conflicts=('xplayer-plparser-git')
url='https://github.com/linuxmint/xplayer-plparser'

source=("${pkgname}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('008d061b8a5cedf9b09b2cd833fdf698')

build() {
    mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    meson --prefix=/usr \
          --libexecdir=lib/${pkgname} \
          --buildtype=plain \
          ..
    ninja
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}/build
    DESTDIR="$pkgdir/" ninja install
}
