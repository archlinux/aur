# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

pkgrealname=webcamoid
pkgname=webcamoid-git
pkgver=6.0.0.r3.ga649e2e
pkgrel=1
pkgdesc="Webcamoid is a full featured webcam capture application."
url='https://github.com/hipersayanX/webcamoid'
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt5-quickcontrols' 'qt5-multimedia' 'qt5-graphicaleffects' 'qt5-svg' 'ffmpeg' 'opencv')
makedepends=('git' 'qt5-tools')
provides=('webcamoid')
conflicts=('kdeplasma-applets-webcamoid' 'webcamoid')
source=("git://github.com/hipersayanX/${pkgrealname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgrealname}"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/${pkgrealname}"
    qmake-qt5 Webcamoid.pro
    make
}

package() {
    cd "$srcdir/${pkgrealname}"
    make INSTALL_ROOT="${pkgdir}" install
}
