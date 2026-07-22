# Maintainer: Ramazan Berk Şirin <ramazanberksirin at protonmail dot com>

pkgname=bettertricks-bin
pkgver=1.0
pkgrel=1
pkgdesc="Recovery-first Wine prefix manager and Winetricks-compatible recipe engine (binary)"
arch=('x86_64')
url="https://github.com/RamazanBerk20/Bettertricks"
license=('LGPL-2.1-or-later')
depends=('webkit2gtk-4.1' 'wine' 'cabextract' '7zip' 'unzip' 'gzip' 'tar' 'xz' 'zstd')
makedepends=('libarchive')
optdepends=('zenity: graphical prompts for compatibility-host recipes')
provides=('bettertricks')
conflicts=('bettertricks')
_debname="Bettertricks_${pkgver}_amd64.deb"
source=(
  "$_debname::$url/releases/download/v$pkgver/$_debname"
  "LICENSE::$url/raw/v$pkgver/LICENSE"
  "bettertricks.desktop::$url/raw/v$pkgver/packaging/linux/io.bettertricks.desktop.desktop"
  "bettertricks.metainfo.xml::$url/raw/v$pkgver/packaging/linux/io.bettertricks.desktop.metainfo.xml"
)
noextract=("$_debname")
sha256sums=(
  '80d8ba1f08e9fac32950c58f11c237f6add0f6924355aaf90f88dca8520aa0d6'
  'bb826495e04f20eef046c421e2b8ac01fea99fc90215badf0185a210aa4a5208'
  '244031234c734653393af7bb4c7145fe97ad4512e772192507156c006164fb87'
  '00ea4cfade9ea542dfd4e4157e426a21e94e6d9682d4c659fb28b82d2a438a27'
)

package() {
  bsdtar -xOf "$srcdir/$_debname" data.tar.gz | bsdtar -xf - -C "$pkgdir"

  rm "$pkgdir/usr/share/applications/Bettertricks.desktop"
  install -Dm644 "$srcdir/bettertricks.desktop" \
    "$pkgdir/usr/share/applications/io.bettertricks.desktop.desktop"
  install -Dm644 "$srcdir/bettertricks.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/io.bettertricks.desktop.metainfo.xml"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
