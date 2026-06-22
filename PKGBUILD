# Maintainer: Michael Hupf <michihupf at protonmail dot com>
_pkgname=gamevox-launcher
pkgname=$_pkgname-bin
pkgver=0.1.58
pkgrel=1
pkgdesc="Voice Chat built for gamers."
arch=('x86_64')
url="https://www.gamevox.com/"
license=('custom')
options=('!strip' '!debug')
depends=('webkit2gtk-4.1' 'gtk3' 'gst-plugins-bad' 'gst-plugins-good' 'pulse-native-provider')
makedepends=('jq' 'curl')
source=(
  "https://gamevox-release-prod.s3.amazonaws.com/launcher/linux/gamevox-launcher"
  "gamevox.desktop"
  "gamevox.png"
)
sha256sums=('SKIP'
  'e2091f703d6421357a959811a5426e91e4baadc0135f91c56f6be0831a62c23a'
  '52d93eb9ec208669143b00cff6bbdef83c3fe80326784c24de4f0736e0439537')
install=$pkgname.install

pkgver() {
  curl -sL https://gamevox-release-prod.s3.amazonaws.com/launcher/linux/manifest.json | jq -r ".version"
}

prepare() {
  chmod +x "$srcdir/$_pkgname"
}

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Desktop file
  install -Dm644 "$srcdir/gamevox.desktop" \
    "$pkgdir/usr/share/applications/gamevox.desktop"

  # Icon images
  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  cp -a "$srcdir/gamevox.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/gamevox.png"
}
