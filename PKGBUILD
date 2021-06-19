pkgname=python-image-match
_module='image-match'
pkgver=1.1.2
pkgrel=1
pkgdesc="simple package for finding approximate image matches from a corpus."
url="https://github.com/ascribe/image-match/"
depends=(python-scikit-image)
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://github.com/ProvenanceLabs/image-match/archive/refs/tags/v1.1.2.tar.gz"
        "grey_gray.patch")
sha256sums=('ebe04ad8d34884268fa982fc6f625ef59c9ffbad65a94fefa8deba3db28ddc72'
            'b9df25ce05163c9f6cc35026e3aa4d37dc33de6df35b76785be746e41a3eaa75')

prepare() {
  cd "${srcdir}/${_module}-${pkgver}"
  patch -p2 -i $srcdir/grey_gray.patch
}

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
