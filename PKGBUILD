# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=batz-converter
gh_pkgname=batzconverter
pkgver=4.0.0
pkgrel=1
pkgdesc="Batman Timezone Converter - show times across multiple timezones"
arch=('x86_64' 'aarch64')
url="https://github.com/chmouel/$gh_pkgname"
license=('Apache-2.0')
depends=('coreutils' 'tzdata')
makedepends=('go')
optdepends=(
  'fzf: interactive timezone selection'
  'wl-clipboard: clipboard/screenshot support on Wayland'
  'librsvg: PNG screenshot rendering (rsvg-convert)'
  'imagemagick: PNG screenshot rendering (alternative)'
)
source=("$gh_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('64656ebeb658add7fe58c34c4c7ac271c3093a962c9ca2ad3694c7228c95df1f')

build() {
  cd "$gh_pkgname-$pkgver" || exit
  export CGO_ENABLED=0
  go build -trimpath -ldflags="-s -w" -o batz ./cmd/batz
}

package() {
  cd "$gh_pkgname-$pkgver" || exit
  install -Dm755 batz "$pkgdir/usr/bin/batz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
}
