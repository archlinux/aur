# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=kona-git
pkgver=20230601
pkgrel=3
pkgdesc="An open-source implementation of the K language, an ASCII APL."
url="https://github.com/kevinlawler/kona"
arch=('i686' 'x86_64')
license=('ISC')
depends=('glibc')
makedepends=('git')
conflicts=('kona')
provides=('kona')
optdepends=('rlwrap: for a nicer repl')
source=('git+https://github.com/kevinlawler/kona.git')
md5sums=('SKIP')
_gitname="kona"

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$_gitname"
  make PREFIX="/usr"
}

package() {
  cd "$_gitname"
  install -Dm755 k       "$pkgdir/usr/bin/k"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
