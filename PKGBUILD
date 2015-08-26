# Maintainer: David Manouchehri <david@davidmanouchehri.com>

pkgname=vim-javascript-git
_gitname=$(printf ${pkgname%%-git})
_gitbranch=develop
_gitauthor=pangloss
pkgver=0.1.0.r4.ge628cba
pkgrel=1
pkgdesc="Vastly improves Vim's JavaScript indentation"
arch=('any')
url="https://github.com/$_gitauthor/$_gitname"
license=('custom:vim')
depends=('vim')
makedepends=('git')
provides=("$_gitname")
conflicts=("$_gitname")
source=("git://github.com/$_gitauthor/$_gitname.git#branch=$_gitbranch")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c 2-
}

package() {
  cd "$srcdir/$_gitname"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles"
  find * -maxdepth 0 -type d -exec cp -R -t "$pkgdir/usr/share/vim/vimfiles" '{}' \+
}

