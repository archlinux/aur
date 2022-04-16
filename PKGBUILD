# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridgectl-git
_pkgname=yabridgectl
_yabridge=yabridge
pkgver=3.8.1.r73.g9420bade
pkgrel=1
pkgdesc="Optional utility to help set up and manage yabridge"
epoch=
arch=('x86_64')
url="https://github.com/robbert-vdh/yabridge"
license=('GPL3')
makedepends=('git' 'cargo')
provides=('yabridgectl')
conflicts=('yabridge-bin' 'yabridgectl')
source=('git+https://github.com/robbert-vdh/yabridge')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_yabridge"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_yabridge/tools/yabridgectl"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$srcdir/$_yabridge/tools/yabridgectl"
  install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
}
