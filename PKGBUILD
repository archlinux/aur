# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-apeye
pkgver=1.4.1
pkgrel=1
pkgdesc='Handy tools for working with URLs and APIs'
arch=('any')
url='https://apeye.readthedocs.io/'
license=('MIT')
depends=(
  'python'
  'python-apeye-core'
  'python-domdf-python-tools'
  'python-platformdirs'
  'python-requests'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-flit-core'
)
#checkdepends=('')
optdepends=(
  'python-cachecontrol: rate limiting'
  'python-lockfile: rate limiting'
  'python-ruamel-yaml: yaml serializer'
  'python-pyaml: yaml serializer'
)
source=("$pkgname::git+https://github.com/domdfcoding/apeye#tag=v$pkgver")
sha512sums=('c3d5c232904ebe45c5e491390fe6862b59372166c602a7b4daa4b0922c1fe8108c6db93d7f2369f95e30d29c671f2a225eb866b0a96bc7eb1796acefb61259f2')
b2sums=('f89ba681cff5e42490a94b84d912eb86796d399d12090256c63e26f351c639ae7b363f296531256cba7b01148ff0186c08f80d92734664f88fb4b6e7bbd30dd1')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
