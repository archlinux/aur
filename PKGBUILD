# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

pkgrealname=webcamoid
pkgname=webcamoid-git
pkgver=7.2.1.r191.g1c67c9de
pkgrel=1
pkgdesc="Webcamoid is a full featured webcam capture application."
url='https://webcamoid.github.io/'
license=('GPL')
arch=('i686' 'x86_64' 'armv6h')
depends=('qt5-quickcontrols'
         'qt5-svg'
         'v4l-utils')
optdepends=('v4l2loopback-dkms: Virtual camera support'
            'ffmpeg: Video playing/recording/conversion (Recommended)'
            'gst-plugins-base: Video playing/recording/conversion'
            'gst-plugins-good: Video playing/recording/conversion'
            'gst-plugins-bad: Video playing/recording/conversion'
            'gst-plugins-ugly: Video playing/recording/conversion'
            'libpulse: Audio playback (Recommended)'
            'alsa-lib: Audio playback'
            'jack: Audio playback'
            'qt5-multimedia: Audio playback'
            'libuvc-git: Camera capture')
makedepends=('git'
             'qt5-tools'
             'qt5-multimedia'
             'ffmpeg'
             'gst-plugins-base-libs'
             'libpulse'
             'alsa-lib'
             'openal'
             'jack'
             'libuvc-git')
provides=('webcamoid')
install="${pkgrealname}.install"
source=("git://github.com/${pkgrealname}/${pkgrealname}.git")
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
