# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Ainola

pkgname=imv-git
pkgver=v2.1.3.r300.ge0e019c
pkgrel=1
pkgdesc='imv is a command line image viewer intended for use with tiling window managers, with Wayland and X11 support.'
url="https://github.com/eXeC64/imv"
arch=('x86_64' 'i686')
license=('MIT')
depends=('libxkbcommon-x11' 'freeimage' 'librsvg' 'desktop-file-utils')
makedepends=('git' 'asciidoc' 'cmocka')
optdepends=('wayland' 'egl-wayland')
provides=('imv')
conflicts=('renameutils' 'imv')
source=("git+https://github.com/eXeC64/imv.git")
sha1sums=('SKIP')

pkgver() {
    cd imv
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    make -C imv BUILDDIR=build
}

check() {
    make check -C imv BUILDIR=build
}

package() {
    make -C imv BUILDDIR=build DESTDIR="$pkgdir" install
    install -Dm644 $srcdir/imv/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
