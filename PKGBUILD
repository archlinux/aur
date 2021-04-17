# Maintainer: Mubashir Haroon <mubashirmusab at gmail dot com>
# Contributor: Husam Bilal <me@husam.dev>

_pkgname=clipman
pkgname=clipman-git
pkgver=1.4.0.r22.g505d7e4
pkgrel=2
pkgdesc="A simple clipboard manager for Wayland"
url="https://github.com/yory8/clipman"
depends=("wl-clipboard>=2.0")
makedepends=("go" "git")
provides=("clipman")
conflicts=("clipman")
license=("GPL3")
arch=("x86_64" "i686")
md5sums=("SKIP")
source=("${_pkgname}::git+https://github.com/yory8/${_pkgname}.git")

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  go build .
}

package() {
  cd $_pkgname
  install -Dm755 $_pkgname $pkgdir/usr/bin/$_pkgname
  install -Dm644 docs/$_pkgname.1 $pkgdir/usr/share/man/man1/$_pkgname.1
  gzip $pkgdir/usr/share/man/man1/$_pkgname.1
}
