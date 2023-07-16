# Maintainer: Wiktor Zykubek <wz-git at mailbox dot org>

pkgname=openfm-qt
pkgver=0.1.3
pkgrel=1
pkgdesc='Qt client for Polish internet radio Open FM.'
arch=('any')
url='https://github.com/wzykubek/openfm-qt'
licence=('ISC')
depends=('python-requests' 'pyside6' 'qt6-multimedia-ffmpeg')
makedepends=('python-build' 'python-installer' 'python-wheel' 'gendesk' 'qt6-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wzykubek/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    gendesk -n -f --pkgname="${pkgname}" --pkgdesc="$pkgdesc" --name="Open FM"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "assets/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
