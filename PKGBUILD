# Maintainer: YadavYashvant <yadavyashvant@example.com>
pkgname=goalin
pkgver=0.1.0
pkgrel=1
pkgdesc="Productivity tracking service for Linux with AI-powered insights"
arch=('any')
url="https://github.com/YadavYashvant/Goalin"
license=('MIT')
depends=('python>=3.9'
         'python-gobject'
         'gtk4'
         'libadwaita'
         'python-xlib'
         'python-pytz')
optdepends=('python-google-generativeai: AI-powered productivity analysis and smart categorization')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/YadavYashvant/Goalin/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/Goalin-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/Goalin-${pkgver}"
    
    # Install Python package
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    
    # Install systemd user service
    install -Dm644 goalin.service "${pkgdir}/usr/lib/systemd/user/goalin.service"
    
    # Install desktop file
    install -Dm644 goalin.desktop "${pkgdir}/usr/share/applications/goalin.desktop"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
