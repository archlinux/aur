# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=apksigcopier
pkgname=python-apksigcopier
pkgver=0.5.0
pkgrel=1
pkgdesc="tool for copying APK signatures from a signed APK to an unsigned one"
arch=('any')
url="https://pypi.org/project/apksigcopier/"
license=('GPL3')
depends=('python' 'python-setuptools' 'python-click')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('47f4f626f1c9b68837634cb792eedb251b6c2fcd7d5a789f30dd045919d4ce73')

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
  # For some reason the metadata files get installed onyl readable for root, this breaks the whole python install...:O
  chmod -R go+r ${pkgdir}/
}
