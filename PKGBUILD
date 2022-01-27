# Contributor: Popolon <popolon@popolon.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=yoga
pkgver=1.1.2
pkgrel=1
pkgdesc="Yummy Optimizer for Gorgeous Assets"
url="https://github.com/wanadev/yoga"
depends=(python-cffi python-pillow python-pycparser python-unidecode
	 python-pyguetzli python-zopfli assimp
	 python-mozjpeg-lossless-optimization)
makedepends=('python-setuptools')
license=('custom')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('745d3323a462d3a8ce3b7db6777dc758120720517a85a2175000b3db1286a68b')

prepare() {
    cd ${pkgname}-${pkgver}
    sed -i 's/--std=c++11/-Wno-error=stringop-overflow -Wno-error=array-bounds/' setup.py
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 
}
