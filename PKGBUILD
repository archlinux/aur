# Maintainer: Gobidev <adrian[dot]groh[at]t-online[dot]de>
# Contributor: sh0rez <me@shorez.de>

pkgname=gmailctl
pkgver=0.10.5
pkgrel=1
pkgdesc="Declarative configuration for Gmail filters"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/mbrt/gmailctl"
license=('MIT')
source=("https://github.com/mbrt/gmailctl/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=('git' 'go')
b2sums=('719e2e0a983a253300a068d241319c8aa60a1e7b544c20df164980cab1ea630bfeaf40b9fb54869b367789978c75c22163e0f20cdd9042c0ccaf2a164e84d82f')

build() {
  cd "$srcdir/gmailctl-${pkgver}"
  CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags "-static"' -o gmailctl ./cmd/gmailctl
}

package() {
  cd "$srcdir/gmailctl-${pkgver}"
  install -Dm755 "$srcdir/gmailctl-${pkgver}/gmailctl" -t "$pkgdir/usr/bin"
}
