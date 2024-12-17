# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-consolekit
pkgver=1.7.2
pkgrel=1
pkgdesc='Additional utilities for click'
arch=('any')
url='https://consolekit.readthedocs.io/'
license=('MIT')
depends=(
  'python'
  'python-click'
  'python-colorama'
  'python-deprecation-alias'
  'python-domdf-python-tools'
  'python-mistletoe'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-flit-core'
)
optdepends=(
  'python-psutil: better terminal support'
)
source=("$pkgname::git+https://github.com/domdfcoding/consolekit#tag=v$pkgver")
sha512sums=('9f7973b41b2a59c95206661018ed7bb1e1b46643f4e1048d1ffb45f7f45963e35545c85ca0d11c5f649605b559f9e4d302deeea52a8bb4130a8cb32786713bc9')
b2sums=('fecc6cf1f19545c79f0d35487403e6f2134df26e4b2080fcb4352dda7668ecb1c72b8d139d8e52d221f05d6a07bbd86ba19b9ac4bfb9492c1d03b318621732d6')

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
