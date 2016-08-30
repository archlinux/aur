# Maintainer: Ted Meyer <tmathmeyer@gmail.com>

_pkgname=tint3
pkgname=$_pkgname-git
pkgver=304
pkgrel=1
pkgdesc='An independant status bar for X11 (works best with bspwm)'
arch=('x86_64')
url="https://github.com/tmathmeyer/${pkgname}"
license=('GPL')
depends=('libxft' 'xcb-util-wm' 'libxinerama')
makedepends=('git' 'libx11' 'xcb-util')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}" "tint3 tint3-cpp-git")
source=("git+https://github.com/tmathmeyer/tint3.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"
    make binary
}

package() {
    installDir="$pkgdir/usr/bin"
    fontDir="$pkgdir/usr/share/fonts/TTF"
    install -dm755 "$installDir"
    install -dm755 "$fontDir"
    install -m755 "$srcdir/$_pkgname/fonts/sakamoto-11.bdf" "$fontDir/sakamoto-11.bdf"
    install -m755 "$srcdir/$_pkgname/build/binary/tint3" "$installDir/tint3"
}
