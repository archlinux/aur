# Maintainer: Stefan Naumann <me@stefannaumann.de>
_pkgname=swayrandr
pkgname=${_pkgname}-git
pkgver=1.0.1.g844d4af
pkgrel=1
pkgdesc="xrandr and lxrandr clone for Sway tiling wayland compositor."
arch=('any')
url="https://codeberg.org/snaums/swayrandr"
license=('GPL-3')
depends=('sway')
provides=('swayrandr')
conflicts=('swayrandr')
makedepends=(
  'go'
  'git'
)
source=("swayrandr::git+https://codeberg.org/snaums/swayrandr.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git describe --tags --always | sed 's/-/./g')
}

build() {
  cd "$srcdir/$_pkgname"
  make dist
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 swayrandr "$pkgdir/usr/bin/swayrandr"
  install -Dm755 lswayrandr "$pkgdir/usr/bin/lswayrandr"
}

