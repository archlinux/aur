# Maintainer: David Thurstenson <thurstylark@gmail.com>
# Contributor: Manuel Conzelmann
pkgname=sdtool-git
_pkgname=${pkgname%-git}
pkgver=r9.6154df2
pkgrel=1
pkgdesc="A small tool for managing the write protection flag of SD cards"
arch=('i686' 'x86_64')
url="https://github.com/BertoldVdb/sdtool"
license=('custom')
depends=('glibc')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
source=("git+https://github.com/BertoldVdb/sdtool.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
