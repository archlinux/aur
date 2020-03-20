pkgname=vesc_tool-git
pkgver=r157.6f378c1
pkgrel=1
pkgdesc="VESC ESC graphical configuration tool"
arch=('any')
url="https://vesc-project.com/"
license=('GPL')
groups=()
depends=("qt5-connectivity" "qt5-serialport" "qt5-quickcontrols2")
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/vedderb/vesc_tool.git")
noextract=()
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"

    qmake -config release "CONFIG += release_lin build_original"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p $pkgdir/usr/bin/
    cp build/lin/vesc_* $pkgdir/usr/bin/vesc_tool
}

