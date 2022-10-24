# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Davide Depau <davide@depau.eu>

_pkgname=wireguard-go
pkgname=${_pkgname}-git
pkgver=0.0.20220316.r9.gbb719d3
pkgrel=1
pkgdesc="Go userspace implementation of WireGuard"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://git.zx2c4.com/wireguard-go/"
license=('GPL')
makedepends=('go')
conflicts=("${_pkgname}")
provides=("${_pkgname}" "wireguard")
source=("${_pkgname}::git+https://git.zx2c4.com/wireguard-go.git")
sha1sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir"
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
