# Maintainer: Gobidev <adrian[dot]groh[at]t-online[dot]de>
# Contributor: sh0rez <me@shorez.de>

pkgname=gmailctl
pkgver=0.11.0
pkgrel=1
pkgdesc="Declarative configuration for Gmail filters"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/mbrt/gmailctl"
license=('MIT')
source=("https://github.com/mbrt/gmailctl/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=('git' 'go')
b2sums=('2e963c992f3646666ab6fdc4fa554ba7e44d2b1f65ce183ac6a3b2f5a8af8ad2761b624afc685d1b78636cf76e93b7bc906d888b69fc746734ba9b5e555fe078')

build() {
  cd "$srcdir/gmailctl-${pkgver}"
  CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags "-static"' -o gmailctl ./cmd/gmailctl
}

package() {
  cd "$srcdir/gmailctl-${pkgver}"
  install -Dm755 "$srcdir/gmailctl-${pkgver}/gmailctl" -t "$pkgdir/usr/bin"
}
