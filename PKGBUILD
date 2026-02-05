# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-n64img
pkgver=0.3.3
pkgrel=1
pkgdesc='N64 image format library'
arch=(any)
url='https://github.com/decompals/n64img'
license=(MIT)
depends=(python python-pypng)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('be6404c474ffa5b1141856d95ac30a30091ac697d4e1cc9acad100c5e3fe027c16e85452deccdaa2ae3a02a7dceeab2f908dbe5ec0c181e8f03ee0b12d9a125c')
b2sums=('ba94de2ebfd9598f4b9ced7216725a4740f56ca4ff58bffd93653e7610a9c71afa16125c04e5023e4a34b5d762f2fa9fdba6a53f54dd8baca9d66ed0f518a90f')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
