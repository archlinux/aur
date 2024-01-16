# Maintainer: Nikolay Arhipov <n@arhipov.net>

pkgname=vita-parse-core-git
pkgver=28.644b5f0
pkgrel=1
pkgdesc="Sony PS Vita core dump parser"
arch=('any')
url="https://github.com/xyzz/vita-parse-core"
license=('MIT')
groups=()
depends=('python' 'python-pyelftools' 'vitasdk')
makedepends=('git')
provides=("vita-parse-core")
conflicts=("vita-parse-core")
source=('git+https://github.com/xyzz/vita-parse-core.git' '0001-Fixed-util.py.patch' 'main')
sha256sums=('SKIP'
            'c36bc9d72c39ea271cc14f0c53907625ff26214f1b65783369f8d64e64f83541'
            '1c4a20233aeb0743dad1d8d3e2ee790fe60603baa1588df0625b5def2d2d0dd9')


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
