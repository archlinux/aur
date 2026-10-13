# Maintainer: Rockeyxx <ommmar310@gmail.com>
pkgname=aj179-linux-git
pkgver=r44.107d742
pkgrel=1
pkgdesc="Ajazz AJ179 mouse on Linux: battery service, settings tool (ajazzctl) and desktop app"
arch=('x86_64')
url="https://github.com/Rockeyxx/aj179-linux"
license=('MIT')
depends=('python-pyqt6')
makedepends=('git' 'gcc' 'make')
provides=('aj179-linux' 'aj179-linux-battery' 'aj179-linux-battery-git')
conflicts=('aj179-linux' 'aj179-linux-battery' 'aj179-linux-battery-git')
source=("git+https://github.com/Rockeyxx/aj179-linux.git")
backup=('etc/conf.d/ajazz-battery')
install=aj179-linux.install
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/aj179-linux"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/aj179-linux"
  make
}

package() {
  cd "$srcdir/aj179-linux"
  make DESTDIR="$pkgdir" PREFIX=/usr SYSTEMD_DIR=/usr/lib/systemd/system install
}
