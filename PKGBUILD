# Contributor: Hugo Ideler <ideler AT gmail DOT com>
pkgname=dropbox-fix2
pkgver=r24.d284f5d
pkgrel=1
pkgdesc="Fix to enable dropbox on non-ext4 filesystems (dark github repo)"
arch=("i686" "x86_64")
url="https://github.com/dark/dropbox-filesystem-fix"
license=('MIT')
depends=('dropbox')
makedepends=('git')

_gitroot='https://github.com/dark/dropbox-filesystem-fix.git'
_gitname='dropbox-filesystem-fix'

source=("$_gitname::git+$_gitroot" "arch_paths.patch")
md5sums=('SKIP'
         '7275dd87e1643f1bf28e3c8d24711a80')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  patch -p1 < ../arch_paths.patch
  make
}

package() {
  install -Dm755 "$srcdir/$_gitname"/libdropbox_fs_fix.so "$pkgdir"/usr/local/lib/libdropbox_fs_fix.so
  install -Dm755 "$srcdir/$_gitname"/dropbox_start.py "$pkgdir"/usr/local/bin/dropbox
}

