# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=studip-sync-git
pkgver=r19.75dce5e
pkgrel=1
pkgdesc="Sync your files from Stud.IP"
arch=('any')
url="https://github.com/popeye123/studip-sync"
license=('UNLICENSE')
depends=('p7zip' 'rsync' 'curl')
makedepends=('git')
source=("$pkgname::git+https://github.com/popeye123/studip-sync.git")
md5sums=('SKIP')
backup=('etc/studip-sync.conf.d/user.conf' 'etc/studip-sync.conf.d/courses.conf')

pkgver(){
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 755 studip-sync $pkgdir/usr/bin/studip-sync
  install -Dm 644 user.conf $pkgdir/etc/studip-sync.conf.d/user.conf
  install -Dm 644 courses.conf $pkgdir/etc/studip-sync.conf.d/courses.conf
}

# vim:set ts=2 sw=2 et:
