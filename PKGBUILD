# Maintainer: keithamus <archlinux at keithcirkel dot co dot uk>

pkgname=keylight-systray
pkgver=r5.95e5ddb
pkgrel=1
pkgdesc=" Elgato Keylight systray control golang "
arch=('i686' 'x86_64')
url="https://github.com/mschneider82/keylight-systray"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
optdepends=("git: To interact with repositories")
provides=('keylight-systray')
conflicts=('keylight-systray')
source=("git+https://github.com/mschneider82/keylight-systray.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "keylight-systray"

  #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "keylight-systray"

  go build
}

check() {
  cd "keylight-systray"

  #go test ./...
  echo "This package has no tests yet"
}

package() {
  cd "keylight-systray"

  install -Dm755 "keylight-systray" -t "$pkgdir/usr/bin"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/keylight-systray"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/keylight-systray"
}

