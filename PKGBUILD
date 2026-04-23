# Maintainer: AMVZEN 
pkgname=synclyrics
pkgver=1.2.0
pkgrel=1
pkgdesc="A premium desktop lyrics player for Linux with karaoke mode and audio visualizer"
arch=('any')
url="https://github.com/AMVZEN/synclyrics"
license=('MIT')
depends=('python-pyqt6' 'python-pyqt6-webengine' 'python-numpy' 'python-requests' 'python-unidecode' 'python-pyaudio' 'playerctl' 'libpulse')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-pykakasi: Romanization support for Japanese'
            'python-pypinyin: Romanization support for Chinese')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "icon.png")
sha256sums=('1846402c417e9a4708d35c844d39041da0640f3495ee8dfb56af881ca14e67db'
            '66c1d840e1a252747fd2c8545f85042b11b91856a299fe7c4ff07ec9e1b22d81'
            '084d6f11e5521c21cc67e50a1ebdbef47c0b3a856401ad667e4b10d53f1a1a7f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    # Install Desktop File
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    # Install Icon
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
