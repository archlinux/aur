# Maintainer: Ramazan Berk Şirin <ramazanberksirin at protonmail dot com>

pkgname=bettertricks-bin
pkgver=1.1.0
_tag=1.1
pkgrel=2
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
_debname="Bettertricks_${_tag}_amd64.deb"
source=(
  "$_debname::$url/releases/download/v$_tag/$_debname"
  "LICENSE::$url/raw/v$_tag/LICENSE"
  "bettertricks.desktop::$url/raw/v$_tag/packaging/linux/io.bettertricks.desktop.desktop"
  "bettertricks.metainfo.xml::$url/raw/v$_tag/packaging/linux/io.bettertricks.desktop.metainfo.xml"
)
noextract=("$_debname")
sha256sums=('92eacc0d90c969e6d55294d075f20f8845990846df41cc8193a44ff98a1139db'
            'bb826495e04f20eef046c421e2b8ac01fea99fc90215badf0185a210aa4a5208'
            '244031234c734653393af7bb4c7145fe97ad4512e772192507156c006164fb87'
            'f5d93f1f0252a8633194a0e4b073f6eb4b09332c3f8bf94681556db492a19b7b')

package() {
  bsdtar -xOf "$srcdir/$_debname" data.tar.gz | bsdtar -xf - -C "$pkgdir"

  rm "$pkgdir/usr/share/applications/Bettertricks.desktop"
  install -Dm644 "$srcdir/bettertricks.desktop" \
    "$pkgdir/usr/share/applications/Bettertricks.desktop"
  install -Dm644 "$srcdir/bettertricks.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/io.bettertricks.desktop.metainfo.xml"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
