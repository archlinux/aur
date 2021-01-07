# Maintainer: sh0rez <me@shorez.de>

pkgname=gmailctl
pkgver=0.8.0
pkgrel=0
pkgdesc="Declarative configuration for Gmail filters"
arch=('i686' 'x86_64' 'arm' 'aarch64')

url="https://github.com/mbrt/gmailctl"
license=('MIT')
source=("git+https://github.com/mbrt/gmailctl#tag=v${pkgver}")

makedepends=('git' 'go')
provides=(gmailctl)
md5sums=('SKIP')

build() {
  cd "$srcdir/gmailctl"
  CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags "-static"' -o gmailctl ./cmd/gmailctl
}

package() {
  install -Dm755 "$srcdir/gmailctl/gmailctl" -t "$pkgdir/usr/bin"
}
