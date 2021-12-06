pkgname=python-openexr
_name=OpenEXR
pkgver=1.3.2
pkgrel=2
pkgdesc="Python bindings for ILM's OpenEXR image file format"
url='https://github.com/jamesbowman/openexrpython'
arch=('any')
license=('unknown')
depends=('openexr')
source=(https://files.pythonhosted.org/packages/7c/c4/76bf884f59d3137847edf8b93aaf40f6257d8315d0064e8b1a606ad80b1b/${_name}-${pkgver}.tar.gz
  fix1.patch
  fix2.patch)
sha512sums=('b4b85f3f8860639c4f65a3fe59c721e08573ffe9b2af5cc7e398d9ff249bac604b43fa5bda6f05f8cd248ed7346df1a2972ac7c5a3df12fe0a73b859c618e33d'
  '207129f64bdc6216efde14a6a9f939ac2886ef7351789ab6f02846cefd5e36355ad7333a207a8be45ad718a7a885657ce86c9b05182899fd7384d4bdce199560'
  '872a7e003144237c0f4068d3fb8b53bbc763483b433b9a16fab0d117171afa02136952fdc7c6c94d4467febc9a8766c252ef9f36ceff38f5d97d4ae7af21fd65')

prepare() {
  cd ${_name}-${pkgver}
  patch -p1 <"$srcdir/fix1.patch"
  patch -p1 <"$srcdir/fix2.patch"
}

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
