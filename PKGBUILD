# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-mistletoe
pkgver=1.4.0
pkgrel=1
pkgdesc='A fast, extensible Markdown parser in pure Python'
arch=('any')
url='https://github.com/miyuchina/mistletoe'
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
checkdepends=(
  'python-parameterized'
  'python-pygments'
)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha512sums=('8b13437c72134bdb24c8136fa6a3acabdfa8e3ae2320cd7396ebb0d7fed3ba8b85aaac0b0697fa4808eafa7043bfbe663c0a3f17081825e4466f37a2def51361')
b2sums=('299cdaf77f14fbb764bc7a74f00a4c4ba78bcda4d5b49668b6340ed564b0201e2b3b1aef88481e681c5791e2ca8f146c2bdc300e1505af5ca937d81226572438')

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
