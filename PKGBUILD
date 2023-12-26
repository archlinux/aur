# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-sphinx-substitution-extensions
pkgver=2022.02.16
pkgrel=1
pkgdesc='Extensions for Sphinx which allow for substitutions'
arch=('any')
url='https://github.com/adamtheturtle/sphinx-substitution-extensions'
license=('APACHE')
depends=('python-sphinx')
makedepends=('python-setuptools' 'python-pip')
source=("https://github.com/adamtheturtle/sphinx-substitution-extensions/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('202612ad9826ed6e3b02859cf6d7fabf010ad5997a7dd26b47b6383d950514a02bf6738ea2fc0ca47f64bbf66da0c3d83c47cc4b016a2d40112de35b4781fd62')

prepare() {
  cd $srcdir/sphinx-substitution-extensions-${pkgver}
  sed -i 's/use_scm_version=True/use_scm_version=False/g' setup.py
}

build() {
  cd $srcdir/sphinx-substitution-extensions-${pkgver}
  python setup.py build_ext --inplace
  python setup.py build
}

package() {
  cd $srcdir/sphinx-substitution-extensions-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
