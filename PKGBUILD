# Maintainer: keithamus <archlinux at keithcirkel dot co dot uk>

pkgname=keylight-control
pkgver=0.1.0.r0.g2fb058d
pkgrel=1
pkgdesc=" elgato keylight controller GUI for linux mac and windows "
arch=('i686' 'x86_64')
url="https://github.com/mschneider82/keylight-control"
license=('MIT')
makedepends=('git' 'go')
provides=('keylight-control')
conflicts=('keylight-control')
source=("git+https://github.com/mschneider82/keylight-control.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "keylight-control"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "keylight-control"

  go build
}

check() {
  cd "keylight-control"

  #go test ./...
  echo "This package has no tests yet"
}

package() {
  cd "keylight-control"

  install -Dm755 "keylight-control" -t "$pkgdir/usr/bin"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/keylight-control"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/keylight-control"
}

