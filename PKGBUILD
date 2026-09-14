# Maintainer: Uthopik <josearrillaga@ik.me>

pkgname='openastro.org'
pkgver='1.2'
pkgrel=1
pkgdesc='Open source fully-featured astrology software'
arch=('any')
license=('GPL-3.0-only')
url='https://github.com/Uthopik/openastro-astrology'
depends=(
    'python'
    'gtk3'
    'librsvg'
    'hicolor-icon-theme'
    'python-cairo'
    'python-pytz'
    'pyswisseph'
    'python-gobject'
)
makedepends=('python-setuptools')
optdepends=()
conflicts=('openastro' 'openastro-dev' 'swisseph_12' 'swisseph_18' 'swisseph-fixstars')
source=(
    "${pkgname}_${pkgver}.orig.tar.gz::https://github.com/Uthopik/openastro-astrology/releases/download/v${pkgver}/openastro.org_${pkgver}.orig.tar.gz"
    "${pkgname}-data_${pkgver}.orig.tar.gz::https://github.com/Uthopik/openastro-astrology/releases/download/v${pkgver}/openastro.org-data_${pkgver}.orig.tar.gz"
)
sha256sums=('17884932ee0a5fc24f8703d7220f6e542e6011fe7e4d53c49a8a13b58929d11a'
            '8042a7722be0f9444f52353dc6ca82f72aec346643d64feafe233d2d60812759')

package() {
    # 1. Instalar la aplicación base
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    # 2. Instalar el paquete de datos
    cd "${srcdir}/${pkgname}-data-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    # 3. Icono oficial en el tema del sistema
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icons/openastro.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/openastro.svg"

    # 4. Enlace obligatorio requerida por el código Python para localizar recursos
    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /usr/share/openastro.org "${pkgdir}/usr/bin/openastro.org"
}