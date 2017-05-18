# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=fsql-git
pkgver=r45.db57e29
pkgrel=1
pkgdesc='Search through your filesystem with SQL-esque queries'
arch=('i686' 'x86_64')
url='https://github.com/kshvmdn/fsql'
license=('MIT')
depends=(glibc)
makedepends=(git)
source=('git+https://github.com/kshvmdn/fsql.git')
_gitname='fsql'
md5sums=(SKIP)

pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  fi
}
build(){
  cd "$srcdir"/$_gitname
  go build
}
check(){
  cd "$srcdir"/$_gitname
  go test
}
package(){
  cd "$srcdir"/$_gitname
  install -Dm755 fsql "$pkgdir/usr/bin/fsql"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

