# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-mistletoe
pkgver=1.0.1
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
_commit='dc53c539fe59295a5f53a4dd1059bd3cc2a4e806'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

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
