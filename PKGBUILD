# Maintainer: neolouker <neolouker@gmail.com>
# Contributor: Sebastian Krzyszkowiak <dos@dosowisko.net>
pkgname=intel-power-control-git
pkgver=r37.87b4755
pkgrel=1
pkgdesc="GPU power management for Intel hardware on Linux"
url="https://github.com/jmechnich/intel-power-control"
arch=('x86_64')
license=('GPL-3.0-or-later')
groups=()
depends=('glibc' 'python-pyqt6' 'hicolor-icon-theme' 'python')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/jmechnich/intel-power-control')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}


build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p "$pkgdir/usr/bin"
  make install PREFIX="$pkgdir/usr/"
  chown root:root "$pkgdir/usr/bin/intel-power-control-helper"
  chmod 4755 "$pkgdir/usr/bin/intel-power-control-helper"
}
