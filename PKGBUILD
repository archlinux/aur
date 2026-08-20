# Maintainer: kobe-koto <k [at] koto [dot] cc>
_versioncode=44
_pkgname=fluent-lyrics
pkgname=${_pkgname}-bin
pkgver="0.0.$_versioncode"
pkgrel=1
pkgdesc="Fluent Lyrics, a lyrics viewer supports various sources, written in Flutter. (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/kobe-koto/FluentLyrics"
license=('AGPL-3.0-only')
depends=(
  'gtk3'
  'libepoxy'
  'at-spi2-core'
  'json-glib'
  'glycin'
)
optdepends=(
  'libayatana-appindicator: for tray function to work (Recommended)'
)
provides=('fluent-lyrics')
conflicts=('fluent-lyrics')
source=(
  "cc.koto.fluent_lyrics.desktop"
  "fluent-lyrics.sh"
  "fluent-lyrics.png::${url}/raw/main/assets/icons/logo-rounded.png"
)
source_x86_64=(
  "${_pkgname}-${pkgver}-linux-x64.zip::${url}/releases/download/v${pkgver}+$_versioncode/fluent_lyrics-${pkgver}-linux-x64.zip"
)
source_aarch64=(
  "${_pkgname}-${pkgver}-linux-arm64.zip::${url}/releases/download/v${pkgver}+$_versioncode/fluent_lyrics-${pkgver}-linux-arm64.zip"
)
sha256sums=('29a9f40ec748ba132cd776862f99f84442f8018e1d4b6996691ee9ddf7ad917d'
            '22bda8e153e0a8b97c2657a1fb49c9d0907b93e0b83e2a15664019d14ae97f3e'
            '8e331b6e8925e78030fdc86417e7f8fbf987a30261d1cf09432e5baaff027282')
sha256sums_x86_64=('57bcb002066c9b785269cce93df4db9e6f67a1aaa2c183f039a19056d0697bb8')
sha256sums_aarch64=('300bf604a6e0bddd8822e7d18f376525635916226d8c77eac890142439f0034f')

package() {
  install -d "$pkgdir/usr/lib/fluent-lyrics"
  cp -r "$srcdir/data/" "$pkgdir/usr/lib/fluent-lyrics/"
  cp -r "$srcdir/lib/" "$pkgdir/usr/lib/fluent-lyrics/"
  install -m755 "$srcdir/fluent_lyrics" "$pkgdir/usr/lib/fluent-lyrics/fluent_lyrics"

  install -Dm755 "$srcdir/fluent-lyrics.sh" "$pkgdir/usr/bin/fluent-lyrics"
  install -Dm644 "$srcdir/fluent-lyrics.png" "$pkgdir/usr/share/pixmaps/fluent-lyrics.png"
  install -Dm644 "$srcdir/cc.koto.fluent_lyrics.desktop" "$pkgdir/usr/share/applications/cc.koto.fluent_lyrics.desktop"
}
