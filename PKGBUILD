# Maintainer: Joris Coenen (joris.coenen @ domain of package url)
pkgname=secrethub-cli
pkgver=0.44.0
pkgrel=1
pkgdesc='Command Line Interface for SecretHub'
arch=('x86_64')
url="https://secrethub.io/"
license=('Apache')
makedepends=('go-pie')
optdepends=('xclip: Clipboard support' 'less: Improved pagination experience')
source=("$pkgname::git+https://github.com/secrethub/secrethub-cli.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  go build \
       -ldflags "-s -w -X "github.com/secrethub/secrethub-cli/internals/secrethub.Commit=$(git rev-parse --short HEAD)" -X "github.com/secrethub/secrethub-cli/internals/secrethub.Version=v$pkgver" -extldflags ${LDFLAGS}" \
       -tags=production \
       -trimpath \
       -o $pkgname \
       ./cmd/secrethub
}

check() {
  cd $pkgname
  go test ./...
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir"/usr/bin/secrethub
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

