# Maintainer: Shatur95 <genaloner@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: ful1e5 <kaizmandhu at gmail dot com>

pkgname=bibata-cursor-theme
pkgver=1.0.1
pkgrel=1
pkgdesc="Material Based Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor"
license=('GPL3')
makedepends=('python-clickgen')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-bitmaps-$pkgver.zip::$url/releases/download/v$pkgver/bitmaps.zip")
noextract=("$pkgname-bitmaps-$pkgver.zip")
sha256sums=('4764ffffbee14570bd2bb866f2e74e3957429343f99571219e0a120b89a5e81b'
            '2756d308ef385746d65b206fea880a8cfcd94b512b711d4b1dc8ed0dc6f7d108')

prepare() {
  cd Bibata_Cursor-$pkgver
  mkdir -p bitmaps
  bsdtar -xf "$srcdir/$pkgname-bitmaps-$pkgver.zip" -C bitmaps

  rm -rf themes
}

build() {
  cd Bibata_Cursor-$pkgver
  python build.py --x11
}

package() {
  cd Bibata_Cursor-$pkgver
  install -d "$pkgdir"/usr/share/icons
  cp -r themes/Bibata-* "$pkgdir"/usr/share/icons
  chmod -R 755 "$pkgdir"/usr/share/icons/Bibata-*
}
