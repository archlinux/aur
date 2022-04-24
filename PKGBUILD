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
sha256sums=('5a228398d91dd979d778dd08cc1468c811c5d453eaae7a4c8faf5b14f66a40f5')

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
