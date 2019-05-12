# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Contributor: Guilherme Calé <gui@cabritacale.eu>

pkgname=fs-uae-launcher
pkgver=2.8.3
pkgrel=3
pkgdesc='Graphical user interface for the fs-uae Amiga emulator'
arch=('any')
url='https://fs-uae.net/launcher/'
license=('GPL2')
depends=('fs-uae' 'python' 'python-setuptools' 'python-pyqt5' 'python-six'
         'hicolor-icon-theme')
optdepends=('p7zip: for .7z file support'
            'python-lhafile: for .lha file support')
source=("https://fs-uae.net/stable/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'remove_inbuilt_six.patch'
        'fs-uae-launcher.patch')
sha256sums=('8ce764031013516daab76e996eff9e9fdead6c0f00b4e497fc927f7719d8a233'
            '4cdbcc3c522517cfa59d5296372afae7e22832673b94cd328bef151ec4db5f23'
            'e151b62ce6b998e129fcd6881f50cf3f2c2cad76bd13e3cb09b219b6fd9617cd')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    patch -Np0 -i "${srcdir}/remove_inbuilt_six.patch"
    patch -Np0 -i "${srcdir}/fs-uae-launcher.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    
    make all
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" prefix='/usr' install
}
