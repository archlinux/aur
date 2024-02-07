# Contributor: Sergey Vlasov <sergey@vlasov.me>

pkgname=nulloy
pkgver=0.9.7.1
pkgrel=1
pkgdesc='Music player with a waveform progress bar'
arch=('x86_64')
url='http://nulloy.com/'
license=('GPLv3')

depends=(
    'gst-plugins-base'
    'gst-plugins-base-libs'
    'gst-plugins-good'
    'gstreamer'
    'librsvg'
    'libx11'
    'libxcb'
    'qt5-base'
    'qt5-script'
    'qt5-svg'
    'qt5-x11extras'
    'taglib1'
)

makedepends=(
    'imagemagick'
    'qt5-tools'
    'zip'
)

optdepends=(
    'gst-plugins-bad: additional codecs'
    'gst-plugins-ugly: additional codecs'
)

_snapshot="${pkgname}-${pkgver}"
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${_snapshot}.tar.gz")
sha256sums=('b958bb217582b9dd279c31ccd91fb3f0095d49b3ae5ec6915e9b7d5cf04f31b8')

build() {
    cd "${_snapshot}"
    export PKG_CONFIG_PATH='/usr/lib/taglib1/lib/pkgconfig'

    ./configure \
        --prefix /usr \
        --libdir lib \
        --gstreamer-tagreader \
        --no-update-check

    make
}

package() {
    cd "${_snapshot}"
    make INSTALL_ROOT="${pkgdir}/" install
    install -Dm644 'LICENSE.GPL3' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
