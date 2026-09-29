# Maintainer: Joël Müller <mail@joelmueller.ch>

pkgname=dopeiptv
pkgver=1.2.12
pkgrel=1
pkgdesc='Linux IPTV player with Xtream Codes, M3U, EPG, timeshift, recording and multiview'
arch=('any')
url='https://github.com/slimture/dopeIPTV'
license=('GPL-3.0-or-later')

depends=(
    'python'
    'python-pyqt6'
    'python-requests'
    'python-mpv'
    'python-pychromecast'
    'mpv'
    'ffmpeg'
)

makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)

optdepends=(
    'vlc: external VLC playback'
)

provides=('dopeiptv')
conflicts=(
    'dopeiptv-git'
    'dopeiptv-bin'
)

source=(
    "dopeIPTV::git+https://github.com/slimture/dopeIPTV.git#tag=v${pkgver}"
)

sha256sums=('7e886a97742274b0d7807a5db7fa2a81b43b0f24d9b6ca5e849f7b205f4fe8f3')

build() {
    cd "${srcdir}/dopeIPTV"

    python -m build \
        --wheel \
        --no-isolation
}

package() {
    cd "${srcdir}/dopeIPTV"

    python -m installer \
        --destdir="${pkgdir}" \
        dist/*.whl

    install -Dm644 dopeiptv.desktop \
        "${pkgdir}/usr/share/applications/dopeiptv.desktop"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
