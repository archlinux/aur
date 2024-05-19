# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Joermungand <joermungand at gmail dot com>

pkgname=python2-reportlab
pkgver=3.5.34
pkgrel=3
pkgdesc="A proven industry-strength PDF generating solution"
url="http://www.reportlab.com/"
depends=('freetype2' 'python2-pillow' )
makedepends=('python2-setuptools' )
license=('BSD')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/0f/0b/bce8f4a6641c30889fd82b50665f0f7521d633bfd3360af2c11b8b2200af/reportlab-${pkgver}.tar.gz")
md5sums=('77d37a7f9f785b3666206de0fbc44aab')

build() {
  CFLAGS+=" -Wno-error=incompatible-pointer-types"
    cd $srcdir/${pkgname#*-}-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/${pkgname#*-}-$pkgver
	for file in src/reportlab/lib/units.py src/reportlab/lib/normalDate.py src/reportlab/lib/logger.py \
	src/reportlab/graphics/testdrawings.py src/reportlab/lib/fonts.py src/reportlab/lib/pagesizes.py \
	src/reportlab/graphics/testshapes.py src/reportlab/lib/randomtext.py src/reportlab/lib/__init__.py \
	src/reportlab/lib/formatters.py src/reportlab/graphics/widgets/table.py src/reportlab/lib/corp.py \
	src/reportlab/graphics/barcode/test.py; do
	sed -i 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/' $file;
	sed -i 's/#!\/bin\/env python/#!\/bin\/env python2/' $file;
	sed -i 's/#!\/usr\/pkg\/bin\/python/#!\/usr\/pkg\/bin\/python2/' $file;
	done
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
