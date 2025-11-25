# Maintainer: Tucker Boniface <tucker@boniface.tech>
# Maintainer: Jguer <pkgbuilds at jguer.space>
pkgname="yay-gzip-fix"
_pkgname="yay"
pkgver=12.5.2.r0.924ecd319
pkgrel=1
pkgdesc="Yet another yogurt. Pacman wrapper and AUR helper written in go. (with gzip decompression fix)"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64' 'riscv64')
url="https://github.com/Jguer/yay"
license=('GPL-3.0-or-later')
depends=(
  'pacman>6.1'
  'git'
  )
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
makedepends=('go>=1.24')
options=(!lto)
conflicts=('yay')
provides=('yay')
source=("yay::git+https://github.com/espeer/yay.git#branch=issue-2709")
sha256sums=("SKIP")

# pkgver() {
#   cd "$srcdir/$_pkgname"
#   git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
# }

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$_pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
  cd "$srcdir/$_pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" install
}
