# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=parpd-git
pkgver=1.7.r1.gbfc5f6d
pkgrel=1
pkgdesc="A RFC 1027 compliant proxy ARP daemon"
arch=('i686' 'x86_64')
url="https://roy.marples.name/projects/parpd"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('parpd')
conflicts=('parpd')
source=("git+https://roy.marples.name/git/parpd.git")
sha256sums=('SKIP')


pkgver() {
  cd "parpd"

  git describe --long --tags | sed 's/^parpd-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "parpd"

  make
}

package() {
  cd "parpd"

  make DESTDIR="$pkgdir" BINDIR="/usr/bin" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/parpd/LICENSE"
}
