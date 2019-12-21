# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=wireguard-go
pkgname=${_pkgname}-git
pkgver=v0.0.20191012.13.gddfad45
pkgrel=1
pkgdesc="Go userspace implementation of WireGuard"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://git.zx2c4.com/wireguard-go/"
license=('GPL')
makedepends=('go')
provides=("${_pkgname}" "wireguard")
source=("${_pkgname}::git+https://git.zx2c4.com/wireguard-go.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --dirty 2>/dev/null | sed 's/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir"
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
