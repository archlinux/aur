# Maintainer: Tuncay EŞSİZ <tuncayessiz9@gmail.com>
pkgname=appimagemanager
pkgver=1.0.3
pkgrel=1
pkgdesc="A powerful, user-friendly AppImage management solution for Linux"
arch=('any')
url="https://github.com/tunjayoff/appimagemanager"
license=('MIT')
depends=(
    'python'
    'python-pyqt6'
    'python-packaging'
    'fuse2'
    'gtk-update-icon-cache'
    'desktop-file-utils'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
optdepends=(
    'fuse3: Alternative FUSE implementation'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tunjayoff/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Install the package
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install desktop file
    install -Dm644 resources/appimagemanager.desktop \
        "${pkgdir}/usr/share/applications/appimagemanager.desktop"
    
    # Install icon
    install -Dm644 resources/icon.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/appimagemanager.png"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
