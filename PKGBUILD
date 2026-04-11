# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=spice-crypt
pkgver=2.0.4
pkgrel=1
pkgdesc='Tool to decrypt encrypted LTSpice models'
arch=(x86_64)
url='https://github.com/jtsylve/spice-crypt'
license=(AGPL-3.0-or-later CC-BY-4.0)
depends=(
  glibc
  libgcc
  python
  python-cryptography
)
makedepends=(
  git
  python-build
  python-installer
  python-maturin
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('7b4752dba8b62c1fcd7723f6c206a2a71932dc51d4884e4ac7c6c5862ff3837a2ddcd149904a522c665cb7b74a34cc47d1423080f3aa4b5de8c093f665116525')
b2sums=('67ab61867099af8f91ffb8a2d4cf4716cce81b4f0277fcf370762e829c5e414d1f68856a6c9432db2ed415c1e02084dd352f2fdbf58844295f8e8479600cf3fd')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
