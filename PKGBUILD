# Contributor: Ivan Puntiy <ivan.puntiy-at-gmail>
pkgname=unix-runescape-client
pkgver=4.3.7
pkgrel=1
pkgdesc="RuneScape client for Linux and Unix (RSU-Client,Legacy)"
arch=(any)
url="https://github.com/rsu-client/rsu-client"
license=(GPL2)
depends=(
  'java-runtime' 'perl' 'perl-wx' 'wget' 'libxtst' 'xdg-utils'
  'perl-config-inifiles' 'perl-io-stringy' 'perl-archive-extract'
)
optdepends=(
  'wine: for "compatibility mode" fix'
  'alsa-oss: for "force alsa" fix'
  'pulseaudio: for "force pulseaudio" fix'
  'p7zip: to extract launcher from .msi'
)
conflicts=('runescape-client-bin')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/rsu-client/rsu-client/archive/v$pkgver.tar.gz")
md5sums=('27825d2df15ddec4b4d676ecc23a5423')

package() {
  local _instdir="$pkgdir"/opt/runescape
  cd "$srcdir/rsu-client-$pkgver/runescape"

  mkdir -p "$_instdir" "$pkgdir"/usr/{bin,share/applications}

  # copy the stuff
  cp -t "$_instdir" *.txt runescape updater rsu-settings AUTHORS
  cp -Rt "$_instdir" share rsu
  cp -Rt "$pkgdir"/usr/bin templates/packaging/usr/games/*
  cp -Rt "$pkgdir"/usr templates/packaging/usr/share

  # these libraries are old, and they are not needed anymore with current cairo from [extra]
  rm -rf "$_instdir"/rsu/3rdParty/linux/cairo-nogl
}
