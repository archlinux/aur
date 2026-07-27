# Maintainer: RamazanBerk20 <ramazanberksirin@protonmail.com>
pkgname=liscan-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Clear, complete disk usage scanner for Linux (prebuilt)"
arch=('x86_64')
url="https://github.com/RamazanBerk20/LiScan"
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1' 'glib2' 'polkit')
optdepends=(
  'gvfs: scan remote locations'
  'kio: file-manager context menu integration'
)
provides=("liscan=$pkgver")
conflicts=('liscan')
_deb="LiScan_${pkgver}_amd64.deb"
source_x86_64=(
  "$_deb::$url/releases/download/v$pkgver/$_deb"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/RamazanBerk20/LiScan/v$pkgver/LICENSE"
)
noextract=("$_deb")
sha256sums_x86_64=(
  '2a364005fc0a7d5dbe2d575175ab9dff8a3cc268ffde1b418052a1b1aec5c588'
  'fb981668c18a279e285fc4d83fba1e836cc84dd4daa73c9697d3cfd2d8aca6e0'
)

package() {
  local data_archive
  mkdir -p "$srcdir/deb"
  bsdtar -xf "$srcdir/$_deb" -C "$srcdir/deb"
  data_archive=$(find "$srcdir/deb" -maxdepth 1 -name 'data.tar.*' -print -quit)
  bsdtar -xf "$data_archive" -C "$pkgdir"
  install -Dm644 "$srcdir/LICENSE-$pkgver" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
