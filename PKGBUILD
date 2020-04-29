# Maintainer: airwoodix <airwoodix at posteo dot me>
_name=pykicad
pkgname=python-${_name}
pkgver=0.1.1
pkgrel=1
pkgdesc="Python library for working with KiCAD file formats"
arch=(any)
url="https://github.com/dvc94ch/pykicad"
license=('ISC')
depends=('python' 'python-pyparsing')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('8025179c1143ba612ce8f35f1f35e1a8')
sha256sums=('ded058f3af116845d8a0495f3a8ff4b6a7e707e534c5b71ee61b37fb23553923')


build() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py check
}

package() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # extract license from README.md
  sed -n -e '/ISC License/,$p' README.md > LICENSE
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -f LICENSE
}

# vim:set ts=2 sw=2 et:
