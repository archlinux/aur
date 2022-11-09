# Maintainer: Stipe Kotarac <stipe@kotarac.net>

pkgname=schedtoold-git
pkgver=r9.1c085ac
pkgrel=1
pkgdesc="daemon to change nice values, priorities, scheduling policies of running processes"
url="https://github.com/kotarac/schedtoold"
arch=('x86_64')
license=('GPL')
provides=('schedtoold')
conflicts=('schedtoold')
depends=('schedtool')
makedepends=('ninja')
source=('schedtoold::git+https://github.com/kotarac/schedtoold.git')

pkgver() {
  cd schedtoold/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd schedtoold/
  ninja
}

package() {
  cd schedtoold/
  install -D -m755 -s schedtoold $pkgdir/usr/bin/schedtoold
  install -D -m644 schedtoold.conf $pkgdir/etc/schedtoold.conf
  install -D -m644 schedtoold.service $pkgdir/usr/lib/systemd/system/schedtoold.service
}

sha256sums=('SKIP')
