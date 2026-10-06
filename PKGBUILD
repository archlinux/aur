# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=vercel-sandbox
pkgname=python-$_name
pkgver=0.8.0
pkgrel=1
pkgdesc='Python SDK for Vercel Sandbox.'
arch=('any')
_repo='https://github.com/vercel/vercel-py'
url="$_repo/tree/main/src/$_name"
license=('MIT')
depends=('python'
         'python-vercel-internal-core'
         'python-vercel-oidc'
         'python-anyio'
         'python-httpx2'
         'python-wsproto'
         'python-pydantic')
makedepends=('python-hatchling'
             'python-build'
             'python-installer'
             'python-wheel'
             'git')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-httpx'
              'python-hypothesis'
              'python-trio')
source=("$_name::git+$_repo.git#tag=$_name-v$pkgver")
sha256sums=('c88958e62fdd71617be1b5dfb348b00d385cb4c85a051b72808ffd632f305cf8')

build() {
  cd "$srcdir"/$_name/src/$_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name/src/$_name
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name/src/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
