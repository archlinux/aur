# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Contributor: Guilherme Calé <gui@cabritacale.eu>

pkgname=fs-uae-launcher
pkgver=3.0.0
pkgrel=2
pkgdesc='Graphical user interface for the fs-uae Amiga emulator'
arch=('any')
url='https://fs-uae.net/launcher/'
license=('GPL2')
depends=("fs-uae>=${pkgver}" 'python' 'python-setuptools' 'python-pyqt5' 'python-six'
         'hicolor-icon-theme')
optdepends=('p7zip: for .7z file support'
            'python-lhafile: for .lha file support')
source=("https://fs-uae.net/stable/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'fs-uae-launcher-fix-install-path.patch'
        'fs-uae-launcher-remove-python2.patch')
sha256sums=('ee7ea368f1c8a58755cdd79f091a84ffe4e4d5b50d5523ed892f9d07be41e905'
            '15463d3d3ed5bdc4fb614cea91b93e7678eccce0696c66ac28c194dd7558e3fa'
            'dcb9be9e6881ec8102d230d54ac1dbd8fa3774d2282f5ea62ea67a3aea33045c')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    patch -Np1 -i "${srcdir}/fs-uae-launcher-fix-install-path.patch"
    patch -Np1 -i "${srcdir}/fs-uae-launcher-remove-python2.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    
    make all
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" prefix='/usr' install
}
