# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Ainola

pkgname=imv-git
pkgver=v4.1.0.r3.g04ef944
pkgrel=1
pkgdesc='imv is a command line image viewer intended for use with tiling window managers, with Wayland and X11 support.'
url="https://github.com/eXeC64/imv"
arch=('x86_64' 'i686')
license=('MIT')
depends=('libxkbcommon' 'libxkbcommon-x11' 'cairo' 'icu' 'libx11' 'glu' 'libxcb' 'freeimage' 'librsvg' 'desktop-file-utils')
makedepends=('git' 'asciidoc' 'cmocka' 'meson')
optdepends=(#wayland
            'wayland' 'egl-wayland'
            #image support
            'libtiff' 'libpng' 'libjpeg-turbo' 'librsvg' 'libnsgif')
provides=('imv')
conflicts=('renameutils' 'imv')
source=("git+https://github.com/eXeC64/imv.git")
sha1sums=('SKIP')

pkgver() {
    cd imv
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/imv
    meson --prefix /usr --buildtype=plain . build
    ninja -C build
}

package() {
    cd $srcdir/imv
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 $srcdir/imv/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
