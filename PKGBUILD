# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=vercel-internal-core
pkgname=python-$_name
pkgver=0.2.0
pkgrel=1
pkgdesc='Shared internal runtime for Vercel Python packages.'
arch=('any')
url='https://github.com/vercel/vercel-py'
license=('MIT')
depends=('python'
         'python-httpx2'
         'python-anyio')
makedepends=('python-hatchling'
             'python-build'
             'python-installer'
             'python-wheel'
             'git')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-httpx'
              'python-hypothesis')
source=("$pkgname::git+$url.git#tag=$_name-v$pkgver")
sha256sums=('8decb2baa29333c549c350136119cac08ba5509301d183e34b6291574018488c')

build() {
  cd "$srcdir"/$pkgname/src/$_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$pkgname/src/$_name
  pytest "${pytest_options[@]}"
}

package() {
  cd "$srcdir"/$pkgname/src/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
