# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-consolekit
pkgver=1.9.0
pkgrel=1
pkgdesc='Additional utilities for click'
arch=(any)
url='https://consolekit.readthedocs.io/'
license=(MIT)
depends=(
  python
  python-click
  python-colorama
  python-deprecation-alias
  python-domdf-python-tools
  python-mistletoe
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-flit-core
)
optdepends=(
  'python-psutil: better terminal support'
)
source=("$pkgname::git+https://github.com/domdfcoding/consolekit#tag=v$pkgver")
sha512sums=('0166897671d83fc08be64e575a2799bede98ac4a3d0e1f90e5e9c6a4d6c5829346a5791f7479031b6911673bdf2fb5a0052e3b18a1c64d7d5c9f6e233d1fd5a1')
b2sums=('88e19adaa34ba7b37946ddcb100c6829058082d1ca762980bdd82994fb164ebefb2ce097bfb5c80721d9f38a0a2b8b7eb3420e6b6974ad7a95ccf81ff8809395')

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
