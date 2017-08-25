# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ethtool-git
pkgver=4.10.r9.gb888f35
pkgrel=1
pkgdesc="Utility for controlling network drivers and hardware"
arch=('i686' 'x86_64')
url="https://www.kernel.org/pub/software/network/ethtool/"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=('ethtool')
conflicts=('ethtool')
source=("git+https://git.kernel.org/pub/scm/network/ethtool/ethtool.git")
sha256sums=('SKIP')


pkgver() {
  cd "ethtool"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "ethtool"

  ./autogen.sh
  ./configure --prefix="/usr" --sbindir="/usr/bin"
  make
}

check() {
  cd "ethtool"

  make check
}

package() {
  cd "ethtool"

  make DESTDIR="$pkgdir" install
}
