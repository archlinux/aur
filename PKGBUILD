# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Previous Maintainer: morguldir <morguldir@protonmail.com>
_gitname=PyTMX
pkgname=python-pytmx
pkgver=3.31
_commit=2ef7dcac8526d9b5085c147b70b1078666542f12
pkgrel=2
pkgdesc="Python library to read Tiled Map Editor's TMX maps"
arch=('i686' 'x86_64')
url="https://github.com/bitcraft/$_gitname"
license=('LGPL-3.0-only')
depends=('python>=3.9' 'python-six')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
provides=($pkgname)
conflicts=($pkgname)
source=("git+https://github.com/bitcraft/$_gitname.git#commit=$_commit")
sha256sums=('SKIP')

# implementing https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
build() {
  cd "$srcdir"/$_gitname
  python -m build --wheel --no-isolation
}

package(){
  cd "$srcdir"/$_gitname
  #python setup.py install --root="$pkgdir" --prefix=/usr
  python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
    cd "$srcdir"/$_gitname
    python -m unittest tests/pytmx/test_pytmx.py
}
