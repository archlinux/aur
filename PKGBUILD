# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen
pkgver=0.5.1
pkgrel=2
pkgdesc='A CLI random word generator.'
arch=('x86_64')
url='https://github.com/wordgen/cli'
license=('AGPL-3.0-or-later')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('643164827deb1284fea53acd2bd7a79538b5ea6799a3d11be2127065add0d94b')

build() {
  cd "$srcdir/cli-$pkgver"

  CGO_ENABLED=0 \
    go build \
    -trimpath \
    -ldflags='-s' \
    -buildvcs=false \
    -o ./bin/wordgen \
    ./cmd/wordgen
}

package() {
  cd "$srcdir/cli-$pkgver"

  install -Dm755 ./bin/wordgen -t "$pkgdir/usr/bin/"
  install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/wordgen/"
}
