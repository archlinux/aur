# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Wittfella <wittfella@wittfella.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=qtfm
pkgver=5.9
pkgrel=6
pkgdesc="A lightweight file manager"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/QtFM?content=158787"
license=('GPL')
depends=('file' 'qt5-base' 'desktop-file-utils')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.zip::https://www.opendesktop.org/p/1131642/startdownload?file_id=1466643163&file_name=158787-qtfm.zip&file_type=application/zip&file_size=849391&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownloadfile%2Fid%2F1466643163%2Fs%2Fb1f524b9f576e936a9f0ee7f29d026da%2Ft%2F1521363951%2Fu%2F265658%2F158787-qtfm.zip" make_it_build_fixes.patch)
sha256sums=('07ffd61dd5d4aa7c16f1c544804517b621e3ef1a30eeda97c087219a3cb35128'
            '1a77d7699e60be1af8ba0aef779894599bd46f5bc3545347d3989154d0576642')

prepare() {
  cd $pkgname
  patch -Np1 < "$srcdir"/make_it_build_fixes.patch
}

build() {
  cd $pkgname
  qmake
  make
}

package() {
  cd $pkgname
  make INSTALL_ROOT="${pkgdir}" install
}
