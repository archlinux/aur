# Maintainer: Sam  <dev at samarthj dot com>

# shellcheck disable=2034,2148,2154

pkgname=python-tinyaes
_name=${pkgname#python-}
pkgver=1.0.3
pkgrel=1
pkgdesc="A utility to find python versions on your system."
arch=("any")
url="https://github.com/naufraghi/tinyaes-py.git"
license=("MIT")
depends=("cython")
makedepends=("python-build" "python-installer" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('71efd4bfcd0b68a883f174b06801dcdcc133f8075530c41d0315e5b60bd9730815a89a1b60acaffdfed403d0f50080afbd20ce1539607d05cb340c743558372f')
b2sums=('3f73cd7c3c4483292e8d0d61c9b0c3daa1bdd237f497d3ce60c05b5da6b9a9710b29775b944c7ec8e680ad5bc8f0f9870ce2953d4a2468db8ec7ad2e1fb226a8')

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
