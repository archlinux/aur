# Maintainer:

_module="climage"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgdesc="Convert images to beautiful ANSI escape codes"
pkgver='0.1.3'
pkgrel=1
# https://pypi.org/project/climage
url='https://github.com/pnappa/CLImage'
arch=('any')
license=('GPL3')

depends=(
  'python'
  'python-pillow'
  'python-setuptools' # silence namcap warning

  # AUR
  'python-kdtree'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)

source=(
  "https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
  # "https://raw.githubusercontent.com/pnappa/CLImage/master/LICENSE"
)
sha256sums=(
  '3edb2bdf828093bfa1766c7878bbc29e058f3047ad5f1a63d75da48d50d9aaee'
  # '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

build() {
  cd "$srcdir/$_module-$pkgver"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/$_module-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # install -vDm0644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
