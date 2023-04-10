# Maintainer: Jose Riha <jose1711 gmail com>
#
pkgbase='python-pospell'
pkgname=('python-pospell')
_module='pospell'
pkgver='1.1'
pkgrel=1
pkgdesc="Spellcheck .po files containing reStructuredText translations"
url="https://github.com/AFPy/pospell"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
        "https://github.com/AFPy/pospell/commit/c4feb4d25f23c3584959ba861267f669fbfcc98d.diff")
sha256sums=('622be800caf4b1c5c880d972f5fc91501ffc6194978d9006158e3da182eb5a78'
            '65ebc5bb0383d5f7374c177f3638e346071b8ab9f08aaf58f118cc5cc08aaae2')

prepare() {
  cd "${srcdir}/${_module}-${pkgver}/"
  patch -i ../c4feb4d25f23c3584959ba861267f669fbfcc98d.diff
}
            
build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
