# Maintainer: Max Altshuler
pkgname=jotpad
pkgver=1.1.2
pkgrel=1
pkgdesc="Minimal single-note editor with live markdown formatting"
arch=('any')
url="https://github.com/maxDTM/jotpad"
license=('GPL-3.0-or-later')
depends=('python>=3.9' 'pyside6')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c6310ead43779dda27f0f0a4dc3f099b686e8fc94767165f2c7d816ad9ed4980')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    # Desktop entry
    install -Dm644 data/com.jotpad.Jotpad.desktop \
        "${pkgdir}/usr/share/applications/com.jotpad.Jotpad.desktop"

    # Themes
    install -dm755 "${pkgdir}/usr/share/jotpad/themes"
    install -Dm644 data/themes/*.conf \
        "${pkgdir}/usr/share/jotpad/themes/"

    # Icon
    install -Dm644 data/icons/jotpad.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/jotpad.svg"

    # Man page
    install -Dm644 man/jotpad.1 \
        "${pkgdir}/usr/share/man/man1/jotpad.1"

    # License
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
