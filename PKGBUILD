# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=dropbox-fix
pkgver=r9.7cb9365
pkgrel=1
pkgdesc="Fix to enable dropbox on non-ext4 filesystems"
arch=("i686" "x86_64")
url="https://github.com/dimaryaz/dropbox_ext4"
license=('MIT')
depends=('dropbox')
makedepends=('git')

_gitroot='https://github.com/dimaryaz/dropbox_ext4.git'
_gitname='dropbox_ext4'

source=("$_gitname::git+$_gitroot" "dropbox@.service")
md5sums=('SKIP'
         '2a087e57448ab4e17ff7f4975305c05a')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  install -Dm644 "$srcdir/$_gitname"/libdropbox_ext4.so "$pkgdir"/usr/local/lib/libdropbox_ext4.so
  install -Dm755 "$srcdir/$_gitname"/dropbox "$pkgdir"/usr/local/bin/dropbox
  install -Dm644 "$srcdir"/dropbox@.service "$pkgdir"/etc/systemd/system/dropbox@.service
}

