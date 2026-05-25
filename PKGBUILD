# Maintainer: Debjeet Banerjee <debjeet.banerjee2023@uem.edu.in>
# Co-Maintainer: Imon Chakraborty
pkgname='kaizen-bin'
pkgver='2.0.3'
pkgrel=1
pkgdesc="Terminal-based anime streaming & browsing tool"
arch=('x86_64')
url="https://github.com/serene-brew/kaizen"
license=('MIT')
depends=('mpv' 'curl')
makedepends=('wget')
source=(
  "https://github.com/serene-brew/kaizen/releases/download/v${pkgver}/Kaizen_v${pkgver}_Linux_x86_64.tar.gz"
  "https://github.com/serene-brew/kaizen/raw/main/README.md"
  "https://github.com/serene-brew/kaizen/raw/main/VERSION"
)
sha256sums=(
  '1aef95aee2958433a1be0dbdf01eabe2444d7b0d084bb1bbebc0ca85719ae0f0'
  'SKIP'
  'SKIP'
)

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  mkdir -p "$pkgdir/usr/share/kaizen"

  tar -xvzf "$srcdir/Kaizen_v${pkgver}_Linux_x86_64.tar.gz" -C "$srcdir/"

  install -Dm755 "$srcdir/kaizen" "$pkgdir/usr/bin/kaizen"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"

  install -Dm644 "$srcdir/VERSION" "$pkgdir/usr/share/kaizen/VERSION"

  if [[ -n "$HOME" ]]; then
    mkdir -p "$HOME/.local/share/kaizen"
    rm -f "$HOME/.local/share/kaizen/VERSION"
    cp "$srcdir/VERSION" "$HOME/.local/share/kaizen/VERSION"
  fi
}
