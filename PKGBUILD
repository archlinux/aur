# Maintainer: Blaze Marshall <wertercatt@wertercatt.com>
pkgname='python-validictory'
_module='validictory'
pkgver='1.1.2'
pkgrel=3
pkgdesc="general purpose python data validator"
url="http://github.com/jamesturk/validictory"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=(
  "https://files.pythonhosted.org/packages/source/v/validictory/validictory-${pkgver}.tar.gz"
  'support-new-python-collections-module.patch::https://gist.github.com/dreirund/f36737536cb434e5ac450a5f0dc8f034/raw/df4c7ae700363eaaf4abce3d7a41e66eb092565f/support-new-python-collections-module.patch'
)
sha256sums=(
  '3a87b84658592f75f37d6bab77ac223774c9989dc7349c8aad19a424770835ba'
  '921ebf8c35431dd8ff3e9ee2893ac1a4ee86b8f682ed63e6c6571a7c9abdad3f'
)

prepare() {
  cd "${srcdir}/${_module}-${pkgver}"
  patch -N -p1 --follow-symlinks -i "${srcdir}/support-new-python-collections-module.patch"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
