# Maintainer: Mubashir Haroon <mubashirmusab at gmail dot com>
# Contributor: Husam Bilal <me@husam.dev>

pkgname=clipman-git
pkgver=1.6.1.r0.g52602f2
pkgrel=1
pkgdesc="A simple clipboard manager for Wayland"
url="https://github.com/yory8/clipman"
depends=("wl-clipboard>=2.0")
makedepends=("go" "git")
provides=("clipman")
conflicts=("clipman")
license=("GPL3")
arch=("x86_64" "i686")
md5sums=("SKIP")
source=("${pkgname}::git+https://github.com/yory8/clipman.git")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  go build .
}

package() {
  cd $pkgname
  install -Dm755 clipman $pkgdir/usr/bin/clipman
  install -Dm644 docs/clipman.1 $pkgdir/usr/share/man/man1/clipman.1
  gzip $pkgdir/usr/share/man/man1/clipman.1
}
