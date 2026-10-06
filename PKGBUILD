# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=tavily-python
pkgname=python-$_name
pkgver=0.8.5
_commit=4fb9334a05cb94b9b329625547ad8fd6a546c998
pkgrel=1
pkgdesc="Python wrapper for the Tavily API."
arch=('any')
url="https://github.com/tavily-ai/tavily-python"
license=('MIT')
depends=('python'
         'python-requests'
         'python-tiktoken'
         'python-httpx')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'python-wheel'
             'git')
checkdepends=('python-pytest'
              'python-typing_extensions')
source=("$_name::git+$url.git#commit=$_commit")
sha256sums=('a5615f112a9ee279cc1b9566790bac2f06e75d879026514c40ab6a0b267c9360')

build() {
  cd "$srcdir"/$_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
