# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=udpspeeder-git
_gitname=UDPspeeder
pkgver=v2@20171021.0.r16.g9714332
pkgrel=1
pkgdesc="Improve your Network Quality on a High-latency Lossy Link by using Forward Error Correction"
arch=('i686' 'x86_64')
url="https://github.com/wangyu-/UDPspeeder"
license=('GPL3')
depends=()
makedepends=('git')
optdepends=('openvpn: tunnel TCP/ICMP')
source=("git://github.com/wangyu-/UDPspeeder.git")
md5sums=('SKIP')
conflicts=('udpspeeder')
provides=('udpspeeder')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  sed -i 's/-ggdb//' makefile
}

build() {
  cd "$srcdir/$_gitname"
  make
  strip -s speederv2
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 speederv2 "$pkgdir/usr/bin/speederv2"
}
