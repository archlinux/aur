# Maintainer: Your Name <your.email@example.com>
pkgname=instagram-reels-downloader
pkgver=1.0.1
pkgrel=1
pkgdesc="A beautiful native GTK application for downloading Instagram reels with one click"
arch=('any')
url="https://github.com/Aznit11/instagram-reels-downloader"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3' 'yt-dlp')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Aznit11/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('093c32db093b7b3821365dd0294f16ab15f9e684a2f89e99cf52728b531fc1bf')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Install Python application
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    
    # Install desktop file
    install -Dm644 instagram-reels-downloader.desktop \
        "${pkgdir}/usr/share/applications/instagram-reels-downloader.desktop"
    
    # Install icon
    install -Dm644 instagram-reels-downloader.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/instagram-reels-downloader.svg"
    
    # Install documentation
    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    # Install license
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
