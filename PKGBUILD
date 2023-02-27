# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Ainola

pkgname=imv-git
_pkgname=imv
pkgver=4.4.0.r0.g885e173
pkgrel=1
pkgdesc='imv is a command line image viewer intended for use with tiling window managers, with Wayland and X11 support.'
url="https://git.sr.ht/~exec64/imv"
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
source=("git+https://git.sr.ht/~exec64/imv")
sha1sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    meson setup --prefix /usr --buildtype=plain . build
    ninja -C build
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
