# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-aiofile
_name=${pkgname#python-}
pkgver=3.9.0
pkgrel=1
pkgdesc="Real asynchronous file operations with asyncio support"
arch=('any')
url="https://github.com/mosquito/aiofile"
license=('Apache-2.0')
depends=('python-caio')
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e5ad718bb148b265b6df1b3752c4d1d83024b93da9bd599df74b9d9ffcf7919b')

build() {
  cd "$_name-$pkgver"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
