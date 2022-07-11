# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=cheat
pkgname=$_pkgname-bash-git
pkgver=20220709.r43.73f133d
pkgrel=1
pkgdesc='A Bash reimplementation of a command line tool to create and view interactive cheatsheets'
url='https://github.com/jahendrie/cheat'
license=('GPL3')
arch=('any')
depends=('bash')
makedepends=('git')
source=("git+$url")
sha512sums=('SKIP')
conflicts=("$_pkgname-git")

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  install -Dm755 src/$_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 doc/$_pkgname.1.gz "$pkgdir/usr/share/man/man1/$_pkgname.1.gz"
  install -d "$pkgdir//usr/share/$_pkgname"
  cp -R data/* "$pkgdir/usr/share/$_pkgname/"
}
