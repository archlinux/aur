# Maintainer: Nocifer <apmichalopoulos at gmail dot com>


pkgname=icoextract
pkgver=0.1.2
pkgrel=4
pkgdesc='Icon extractor for Windows PE files (.exe/.dll) with optional thumbnailer functionality'
arch=('any')
url='https://github.com/jlu5/icoextract'
license=('MIT')
depends=('python-pefile')
makedepends=('git' 'python-setuptools')
optdepends=('python-pillow: required for the optional thumbnailer')
conflicts=('exe-thumbnailer')
source=("$pkgname-git::git+https://github.com/jlu5/icoextract.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
    cd ${pkgname}-git
   
    python setup.py build
}
     
package() {
    cd ${pkgname}-git
    
    python setup.py install --root="${pkgdir}" --optimize=1
    
    install -Dm644 exe-thumbnailer.thumbnailer ${pkgdir}/usr/share/thumbnailers/exe-thumbnailer.thumbnailer
}
