# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

_name=mando
pkgname=python-$_name
pkgver=0.8.2
pkgrel=1
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
sha256sums=('539659d9a2fdc6c9a188211c58f381e0dafe9597085174c5472eb1ed0224b6b5')

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
