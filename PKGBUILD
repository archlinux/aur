# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=kibi-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A tiny text editor, written in Rust"
url="https://github.com/ilai-deutel/kibi"
makedepends=('slsa-verifier')
depends=('gcc-libs' 'glibc')
conflicts=('kibi')
provides=('kibi')
arch=('x86_64' 'i686' 'aarch64')
license=('MIT OR Apache-2.0')
backup=('etc/kibi/config.ini')
source_x86_64=(
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz.asc"
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz.intoto.jsonl"
)
source_i686=(
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-i686-unknown-linux-gnu.tar.gz"
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-i686-unknown-linux-gnu.tar.gz.asc"
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-i686-unknown-linux-gnu.tar.gz.intoto.jsonl"
)
source_aarch64=(
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-i686-unknown-linux-gnu.tar.gz"
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-i686-unknown-linux-gnu.tar.gz.asc"
  "https://github.com/ilai-deutel/kibi/releases/download/v${pkgver}/kibi-v${pkgver}-i686-unknown-linux-gnu.tar.gz.intoto.jsonl"
)
sha256sums_x86_64=('4697e9cca0539774f938a7a29ed0f3aac1a62fc683b8dd1ed85f5e8c183360ce'
                   'SKIP'
                   '1c567a8a164dfb6c31f86a22cd9527499eb1f81ca459bfd54e0ab4b97cfd5097')
sha256sums_i686=('cf8b90ea9e8b922964bc6b154030d5bdb5f66a421e42e019aae34dc37839609e'
                 'SKIP'
                 'ba8ed0ddf96befc0264bc8eb5dd28aed3bd1de9b61f1ed2241039883020fdc66')
sha256sums_aarch64=('cf8b90ea9e8b922964bc6b154030d5bdb5f66a421e42e019aae34dc37839609e'
                    'SKIP'
                    'ba8ed0ddf96befc0264bc8eb5dd28aed3bd1de9b61f1ed2241039883020fdc66')
validpgpkeys=(
  '102588418FF7E165696490A206E8A973494808A2'  # Ilaï Deutel
)
options=(
  "!strip"  # Symbols already stripped upstream
)

verify() {
  slsa-verifier verify-artifact \
    "kibi-v${pkgver}-$CARCH-unknown-linux-gnu.tar.gz" \
    --provenance-path "kibi-v${pkgver}-$CARCH-unknown-linux-gnu.tar.gz.intoto.jsonl" \
    --source-uri "github.com/ilai-deutel/kibi" \
    --source-versioned-tag "v${pkgver}"
}

package() {
  # Install binary
  install -Dm755 "kibi" -t "$pkgdir/usr/bin"

  # Install configuration files
  install -Dm644 "config_example.ini" "$pkgdir/etc/kibi/config.ini"
  install -Dm644 syntax.d/* -t "$pkgdir/usr/share/kibi/syntax.d"

  # Install license
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
