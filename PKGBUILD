# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=vercel-oidc
pkgname=python-$_name
pkgver=0.9.0
pkgrel=1
pkgdesc='OIDC helpers for Vercel Python applications.'
arch=('any')
_repo='https://github.com/vercel/vercel-py'
url="$_repo/src/$_name"
license=('MIT')
depends=('python'
         'python-anyio'
         'python-httpx2'
         'python-vercel-headers')
makedepends=('python-hatchling'
             'python-build'
             'python-installer'
             'python-wheel'
             'git')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-cryptography'
              'python-trio'
              'python-pyjwt')
optdepends=('python-pyjwt: verify'
            'python-cryptography: verify')
source=("$_name::git+$_repo.git#tag=$_name-v$pkgver")
sha256sums=('8decb2baa29333c549c350136119cac08ba5509301d183e34b6291574018488c')

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
