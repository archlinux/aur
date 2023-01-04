# Maintainer: robertfoster
pkgname=onetagger
pkgver=1.5.1
pkgrel=2
pkgdesc="Cross-platform music tagger with Beatport, Discogs, Musicbrainz, Spotify, Traxsource and many other services support."
arch=('aarch64' 'x86_64')
url="https://onetagger.github.io/"
license=('GPL3')
depends=('alsa-lib' 'libsndfile' 'openssl' 'webkit2gtk')
makedepends=('cargo' 'npm')
source=(
  "https://github.com/Marekkon5/onetagger/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}.desktop"
)

build() {
  cd "${pkgname}-${pkgver}"/client

  npm i
  npm run build

  cd ..

  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"

  install -Dm755 "target/release/${pkgname}-cli" \
    "${pkgdir}/usr/bin/${pkgname}-cli"

  install -Dm644 "$srcdir/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 assets/128x128.png \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

sha256sums=('a7a1a44d4b1160cb29096c3c065fed42f507926c4e566584d0e5c9db9e5460f6'
  '4e6cba3f230f422f61ef42bfe0f21b2f6016987199cdfc79bccc5b1b8d6a1655')
