# Maintainer: Sam  <dev at samarthj dot com>

# shellcheck disable=2034,2148,2154

pkgname=python-tinyaes
_name=${pkgname#python-}
pkgver=1.1.1
pkgrel=1
pkgdesc="A utility to find python versions on your system."
arch=("any")
url="https://github.com/naufraghi/tinyaes-py.git"
license=("MIT")
depends=("cython")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('77de752720e9d9bc515d5f1deb1c7aee3919ff74d8dc601e212402c48928a510d612869ff9b277896d804f0dfd7e8492f498e12030e6ef49dc1baa49c95cc4bc')
b2sums=('a098afec21f20cc6d1d5af683a4bb95003e7008cf5fd65891bef28ac0c05cf22c6c43391f209ff3ca875dfaa27630d3a5220ade6bcb18426674b9a90f83d0bbf')

build() {
  cd "$srcdir/${_name}-$pkgver" || exit 1
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/${_name}-$pkgver" || exit 1
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
