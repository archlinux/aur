# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-dom-toml
pkgver=2.1.0
pkgrel=1
pkgdesc="Dom's tools for Tom's Obvious, Minimal Language"
arch=(any)
url='https://dom-toml.readthedocs.io/en/latest/'
license=(MIT)
depends=(
  python
  python-domdf-python-tools
  python-toml
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-flit-core
)
#checkdepends=()
#optdepends=()
source=("$pkgname::git+https://github.com/domdfcoding/dom_toml#tag=v$pkgver")
sha512sums=('63ab4f2aa34d3c72285335d4a7cfb988c37ea06be9d0deae56aa115ae8710ba0f4789eb85e12da5ca0d0d14117a3e520bb34c93ae9e8c2ad1ccc0188f58f7a25')
b2sums=('1c7f47dad4998be0608c2381a8fc9bfc1d959a2e9266be371e348dbebd47dfba1ef5f07766a2a916d5d8bac51b73e454438d2903d3a96c88e6a6a1fb6f7320fa')

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
