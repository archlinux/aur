# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=asyncstdlib
pkgname=python-$_name
pkgver=3.14.0
pkgrel=1
pkgdesc="The missing async toolbox."
arch=('any')
url="https://github.com/maxfischer2781/asyncstdlib"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-flit-core' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f99396992a3bba7495d8cf6c832bfe8c8727f61213233d3569a5a9cbd1c04385')

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" unittests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

}
