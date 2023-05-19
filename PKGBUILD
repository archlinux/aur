# Maintainer: Nikolay Arhipov <n@arhipov.net>

pkgname=vita-parse-core-git
pkgver=28.644b5f0
pkgrel=1
pkgdesc="Sony PS Vita core dump parser"
arch=('any')
url="https://github.com/xyzz/vita-parse-core"
license=('MIT')
groups=()
depends=('python' 'python-pyelftools' 'psvita-sdk')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=('git+https://github.com/xyzz/vita-parse-core.git' '0001-Fixed-util.py.patch' 'main')
sha256sums=('SKIP'
            'c65c44c28945f6cba41081f21d0239ed5c57f5e071c17771a294884e1a2ac0b0'
            'd960f31fe65bb36e52fa6d1cac8f00cbe16cfb60763ee4d2a8c9437c031843c2')

pkgver() {
  cd "$srcdir/vita-parse-core"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/vita-parse-core"
  patch -p1 < "$srcdir/0001-Fixed-util.py.patch"
}

package() {
  cd "$srcdir/vita-parse-core"
  mkdir -p "$pkgdir/usr/share/python-vita-parse-core"
  cp -r * "$pkgdir/usr/share/python-vita-parse-core"
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/main" "$pkgdir/usr/bin/vita-parse-core"
}
