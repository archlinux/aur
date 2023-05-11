# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

_name=mando
pkgname=python-$_name
pkgver=0.7.1
pkgrel=2
pkgdesc='Python library wrapping argparse to help write flexible CLI applications'
arch=(any)
url='https://mando.readthedocs.org/'
# Repository: https://github.com/rubik/mando
license=(MIT)
depends=(python)
optdepends=(
  'python-rst2ansi: ReST formatting of console help output'
  'python-sphinx: run unit tests'
)
makedepends=(python-build python-installer python-rst2ansi python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('18baa999b4b613faefb00eac4efadcf14f510b59b924b66e08289aa1de8c3500')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package_python-mando() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
