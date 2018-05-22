# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

pkgname=webcamoid
pkgver=8.1.0
pkgrel=3
pkgdesc="Webcamoid is a full featured webcam capture application."
url='https://webcamoid.github.io/'
license=('GPL')
arch=('i686' 'x86_64' 'armv6h')
depends=('qt5-quickcontrols'
         'qt5-svg')
optdepends=('v4l-utils: Extra formats support for webcams'
            'v4l2loopback-dkms: Virtual camera support'
            'ffmpeg: Video playing/recording/conversion (Recommended)'
            'gst-plugins-base: Video playing/recording/conversion'
            'gst-plugins-good: Video playing/recording/conversion'
            'gst-plugins-bad: Video playing/recording/conversion'
            'gst-plugins-ugly: Video playing/recording/conversion'
            'libpulse: Audio playback (Recommended)'
            'alsa-lib: Audio playback'
            'jack: Audio playback'
            'kde-cli-tools: Root privileges for virtual camera module (Recommended)'
            'gksu: Root privileges for virtual camera module')
makedepends=('v4l-utils'
             'qt5-tools'
             'ffmpeg'
             'gst-plugins-base-libs'
             'libpulse'
             'alsa-lib'
             'jack')
provides=('webcamoid')
conflicts=('webcamoid-git')
install="${pkgname}.install"
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz"
        "0001-Adapt-to-FFmpeg-4.0-API.patch")
sha256sums=('2e51731c36a86a4b3e323c11000a04b7ce06b5d228519676f4070e44e2a62947'
            'bd9ca4471af67ab5ed99f492de33cf26a4858b260654d252c6b3fd89a696864f')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"

    # Backported changes from:
    #
    # https://github.com/webcamoid/webcamoid/pull/119
    # https://github.com/webcamoid/webcamoid/pull/120
    patch -Np1 -i "../0001-Adapt-to-FFmpeg-4.0-API.patch"
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    qmake-qt5 Webcamoid.pro CONFIG+=silent
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
}
