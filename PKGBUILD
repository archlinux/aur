# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-mistletoe
pkgver=1.5.0
pkgrel=1
pkgdesc='A fast, extensible Markdown parser in pure Python'
arch=(any)
url='https://github.com/miyuchina/mistletoe'
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
)
checkdepends=(
  python-parameterized
  python-pygments
)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha512sums=('44438b9ea2f96ed550a4866301b27d4442c85a3ba79dec1c48c380a2de1b0b8398baf766fefdea8d2ff45ec975f51866e3dfa8207ef7c490b6ae573c1ffbc07f')
b2sums=('a9d8c2debe70efab13ba66c49fa7b8129557f1bad88431119c70bdf7dc7da191fd0d092e9c66fef53cd931f3e0c90b60479d616f50863716ebc7640375b23ef6')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest discover test
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
