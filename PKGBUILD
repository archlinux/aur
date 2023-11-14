# Maintainer: Gobidev <adrian[dot]groh[at]t-online[dot]de>
# Contributor: sh0rez <me@shorez.de>

pkgname=gmailctl
pkgver=0.10.7
pkgrel=1
pkgdesc="Declarative configuration for Gmail filters"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/mbrt/gmailctl"
license=('MIT')
source=("https://github.com/mbrt/gmailctl/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=('git' 'go')
b2sums=('dac8e62a79f47a07dcb39d962a8c21b1cc51849a6ab7ad15e7db35b531921d42e5915f5ac8197d3710b4ab9c8a20c8784b5e56db8597862f40c1b427702c04b7')

build() {
  cd "$srcdir/gmailctl-${pkgver}"
  CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags "-static"' -o gmailctl ./cmd/gmailctl
}

package() {
  cd "$srcdir/gmailctl-${pkgver}"
  install -Dm755 "$srcdir/gmailctl-${pkgver}/gmailctl" -t "$pkgdir/usr/bin"
}
