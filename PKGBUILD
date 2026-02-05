# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pygfxd
pkgver=1.0.5
pkgrel=1
pkgdesc='Python bindings for libgfxd using ctypes'
arch=(x86_64)
url='https://github.com/Thar0/pygfxd'
license=(MIT)
depends=(
  glibc
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('6b8e64208fbfeeb8795b5e773d0763a168e24181d79b668f12a48da6e0bc9353ecec1adbe8d4d00cfecee403a459d0f077121e6c7fb5aa5b06c8318c7a4fc103')
b2sums=('81d50b17081f5f6c952d7769e6ee87144d4981d3b19959e25f93de32a6c6743929f3e6d7d22baa6b19c85c94b3ecaf4e5021404a9b12f8d0de9eed313fb89493')

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
