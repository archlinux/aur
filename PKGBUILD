# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Umar Alfarouk <medrivia@gmail.com>

pkgname=fnt
pkgver=1.9
pkgrel=1
pkgdesc='The missing font manager for Linux'
arch=('any')
url='https://github.com/alexmyczko/fnt'
license=('MIT')
depends=('bash' 'curl' 'chafa' 'texlive-bin')
makedepends=('git')
_commit='932759a52546f70c1255258fbd6ee38f1694c302'
source=("$pkgname::git+$url#commit=$_commit")
sha256sums=('b4f3922af8a7123efde22a569fa3d16074bc53cd111183de492cb0c0ad3540e9')

# pkgver() {
#   cd "$pkgname"
# 
#   git describe --tags | sed 's/^v//'
# }

prepare() {
  cd "$pkgname"

  sed 's/ZCOMPDIR=\/usr\/local\/share\/zsh\/site-functions/ZCOMPDIR=\/usr\/share\/zsh\/site-functions/g' -i "$srcdir/fnt/Makefile"
  sed 's/i="apt"/i="pacman"/g' -i "$srcdir/fnt/fnt"
}

package() {
  cd "$pkgname"

  DESTDIR="$pkgdir" make install

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
