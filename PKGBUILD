# Previous maintainer: Davide Depau <davide@depau.eu>
# Maintainer: Antoine Damhet <xdbob@lse.epita.fr>

_pkgname=brightnessctl
pkgname=${_pkgname}-git
pkgver=0.4.r9.g4500f76
pkgrel=1
pkgdesc="Lightweight brightness control tool"
arch=('i686' 'x86_64')
url='https://github.com/Hummer12007/brightnessctl'
license=('MIT')
makedepends=('git' 'pkg-config')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/Hummer12007/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" UDEVDIR=/usr/lib/udev/rules.d install
}

