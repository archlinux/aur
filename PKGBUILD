# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Umar Alfarouk <medrivia@gmail.com>

pkgname=fnt
pkgver=1.9.1.mdrv
pkgrel=1
pkgdesc='The missing font manager for Linux'
arch=('any')
url='https://github.com/mdrv/fnt'
license=('MIT')
depends=('bash' 'curl' 'chafa' 'texlive-bin')
makedepends=('git')
_commit='b03824b56fe0cdc22446c46e401619935942c88e'
source=("$pkgname::git+$url#commit=$_commit")
sha256sums=('4d29a81a638c7f1b4130fdbcd4245be540e0a34e84e7971d342a6f5c5956bf62')

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
