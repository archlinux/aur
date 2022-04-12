# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-mistletoe
pkgver=0.8.2
pkgrel=2
pkgdesc='A fast, extensible Markdown parser in pure Python'
arch=('any')
url='https://github.com/miyuchina/mistletoe'
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
_commit='5916ebd57a52668976831b2d249e96662cb001f4'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python setup.py build
}

check() {
  cd "$pkgname"

  python -m unittest discover test
}

package() {
  cd "$pkgname"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
