# Maintainer: willemw <willemw12@gmail.com>

pkgname=python2-twodict-git
pkgver=1.2.r2.g925d3bd
pkgrel=1
pkgdesc="Simple two way ordered dictionary for Python"
arch=('any')
url="https://github.com/MrS0m30n3/twodict"
license=('custom:UNLICENSE')
depends=('python2')
makedepends=('git')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+$url.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd $pkgname
  python2 test_twodict.py
}

package() {
  cd $pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

