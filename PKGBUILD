# Maintainer: Husam Bilal <me@husam.dev>

pkgname=firefox-larch-bin
_pkgname=firefox
pkgver=128.0a1
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - Larch version"
arch=("x86_64")
url="https://www.mozilla.org/en-US/firefox"
license=(MPL GPL LGPL)
depends=(gtk3 libxt mime-types dbus-glib nss ttf-font)
optdepends=(
  "ffmpeg: H264/AAC/MP3 decoding"
  "networkmanager: Location detection via available WiFi networks"
  "libnotify: Notification integration"
  "pulseaudio: Audio support"
  "speech-dispatcher: Text-to-Speech"
  "hunspell-en_US: Spell checking, American English")
provides=("firefox=$pkgver")
conflicts=("firefox")
source=(
  "https://ftp.mozilla.org/pub/firefox/nightly/latest-larch/firefox-$pkgver.en-US.linux-x86_64.tar.bz2"
  $_pkgname.sh
  $_pkgname.desktop)
sha256sums=(
  "e9c2d55113ebf1e40c5c5f5eaf02c0e35bf83bef462b5f73500bb717c56050d7"
  "73741ec887d82f897381f44c8bd4d6fc955ea82499f04b8414caeff2ee8e14f3"
  "c64008cbf01956ce3dba693230670de58fa9487ad19f4ba76614af13beb1b8ef")

package() {
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/opt

  cp -r firefox/ "$pkgdir"/opt/$pkgname

  install -m755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname
  install -m644 $_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop

  ln -Ts /usr/share/hunspell "$pkgdir"/opt/$pkgname/dictionaries
  ln -Ts /usr/share/hyphen "$pkgdir"/opt/$pkgname/hyphenation
}

