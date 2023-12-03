# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=guizero
pkgname=python-$_name
pkgver=1.5.0
pkgrel=1
pkgdesc='Python module to allow learners to easily create GUIs'
url='https://github.com/lawsie/guizero'
depends=(python-pillow tk)
makedepends=(python-build python-installer python-setuptools python-wheel)
license=(BSD)
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('421f8e6871d795064c1608f8277ae3d252e129f656ddc558b30f577bdc6267d1')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  # install license file
  install -Dm644 license.txt -t "$pkgdir"/usr/share/licenses/$pkgname
  # install readme into docdir
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
