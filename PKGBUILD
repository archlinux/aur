# Maintainer: Popa Ioan Alexandru <alexioanpopa11@gmail.com>

pkgname=gxhk-git
pkgver=1.0.0.r0.g52ab692
pkgrel=1
pkgdesc='Hotkey daemon for X, configurable like bspwm'
arch=('x86_64')
url="https://github.com/ALEX11BR/gxhk"
license=('Unlicense')
makedepends=('go' 'git')
optdepends=('sh: For default config file')
provides=("gxhk")
conflicts=("gxhk")
source=("git+https://github.com/ALEX11BR/gxhk")
sha256sums=('SKIP')

pkgver() {
  cd "gxhk"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "gxhk"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd "gxhk"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
