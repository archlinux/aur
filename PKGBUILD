# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mnotify-git"
pkgver=r44.95a4448
pkgrel=1
pkgdesc="A simple Matrix CLI client, primarily designed for sending notifications"
url="https://codeberg.org/rumpelsepp/mnotify/"
license=("GPL3")
arch=("x86_64" "armv6h" "armv7h" "aarch64")
depends=("libolm")
makedepends=("go" "git")
source=("git+https://codeberg.org/rumpelsepp/mnotify.git")
sha256sums=("SKIP")

pkgver(){
 cd "mnotify"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
 cd "mnotify"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 go build -o mnotify .
}

package(){
 cd "mnotify"
 install -D -m 755 "mnotify" "$pkgdir/usr/bin/mnotify"
}
