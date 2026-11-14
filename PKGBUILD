# Maintainer: Ramazan Berk Şirin <ramazanberksirin at protonmail dot com>

pkgname=bettertricks-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Recovery-first Wine prefix manager and Winetricks-compatible recipe engine (binary)"
arch=('x86_64')
options=('!strip' '!debug')
url="https://github.com/RamazanBerk20/Bettertricks"
license=('LGPL-2.1-or-later')
depends=('webkit2gtk-4.1' 'wine' 'xdg-utils' 'glib2' 'cabextract' '7zip' 'unzip' 'gzip' 'tar' 'xz' 'zstd')
makedepends=('libarchive')
optdepends=('zenity: graphical prompts for compatibility-host recipes')
provides=('bettertricks')
conflicts=('bettertricks')
_debname="Bettertricks_1.2_amd64.deb"  # release files drop a zero patch version
source=(
  "$_debname::$url/releases/download/v$pkgver/$_debname"
  "LICENSE::$url/raw/v$pkgver/LICENSE"
  "bettertricks.desktop::$url/raw/v$pkgver/packaging/linux/io.bettertricks.desktop.desktop"
  "bettertricks.metainfo.xml::$url/raw/v$pkgver/packaging/linux/io.bettertricks.desktop.metainfo.xml"
)
noextract=("$_debname")
sha256sums=('5eda3f27bf96d054cae265d6c4aa59296fdc87b889377142674e887264ad71a6'
            'bb826495e04f20eef046c421e2b8ac01fea99fc90215badf0185a210aa4a5208'
            '244031234c734653393af7bb4c7145fe97ad4512e772192507156c006164fb87'
            '36d1716731b8d7782e17bc9c0e5f73e77785ed0fb6a193126e4034957843586f')

package() {
  bsdtar -xOf "$srcdir/$_debname" data.tar.gz | bsdtar -xf - -C "$pkgdir"

  rm "$pkgdir/usr/share/applications/Bettertricks.desktop"
  install -Dm644 "$srcdir/bettertricks.desktop" \
    "$pkgdir/usr/share/applications/Bettertricks.desktop"
  install -Dm644 "$srcdir/bettertricks.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/io.bettertricks.desktop.metainfo.xml"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
