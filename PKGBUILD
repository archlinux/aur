# Maintainer: Brian Gisseler <gissf1@gmail.com>
pkgname=zram-hibernate-git
pkgver=r26.1f0e5cc
pkgrel=1
pkgdesc="activate disk-based storage as swap for hibernation support when a system typically uses only zram swap"
arch=('any')
url="https://github.com/gissf1/zram-hibernate"
license=('apache')
source=('git+https://github.com/gissf1/zram-hibernate')
makedepends=('git')
depends=('ncurses' 'util-linux' 'bash' 'coreutils' 'sed' 'systemd' 'grep' 'gawk' 'sudo')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/zram-hibernate
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir"/zram-hibernate

  install -dm755 $pkgdir/usr/lib/systemd/system-sleep/
  install -Dm755 zram-hibernate $pkgdir/usr/lib/systemd/system-sleep/zram-hibernate

  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
}
