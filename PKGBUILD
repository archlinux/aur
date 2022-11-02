# Maintainer: Gobidev <adrian[dot]groh[at]t-online[dot]de>
# Contributor: sh0rez <me@shorez.de>

pkgname=gmailctl
pkgver=0.10.6
pkgrel=1
pkgdesc="Declarative configuration for Gmail filters"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/mbrt/gmailctl"
license=('MIT')
source=("https://github.com/mbrt/gmailctl/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=('git' 'go')
b2sums=('774db02bcb06c6e64bf56df6023e2bf1a174d7e9659e2fca643201555376eb160954cf50aa1d14da64e1df46c3b3b9235d3f6f0e0c83cda6b90e190e7705f061')

build() {
  cd "$srcdir/gmailctl-${pkgver}"
  CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags "-static"' -o gmailctl ./cmd/gmailctl
}

package() {
  cd "$srcdir/gmailctl-${pkgver}"
  install -Dm755 "$srcdir/gmailctl-${pkgver}/gmailctl" -t "$pkgdir/usr/bin"
}
