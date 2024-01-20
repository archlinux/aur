# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bibata-extra-cursor-theme
pkgver=1.0.1
pkgrel=2
pkgdesc="Material Based Cursor Theme: More Bibata!"
arch=('any')
url="https://github.com/ful1e5/Bibata_Extra_Cursor"
license=('GPL-3.0-or-later')
depends=('libxcursor' 'libpng')
makedepends=('python-clickgen1')
provides=("${pkgname%-theme}")
conflicts=("${pkgname%-theme}")
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-bitmaps-$pkgver.zip::$url/releases/download/v$pkgver/bitmaps.zip")
noextract=("$pkgname-bitmaps-$pkgver.zip")
sha256sums=('e5c2b0e3960f10df8281681a5ada914f2cf89480abc0c17fd8b677015a9d6ea7'
            'b44127f133ba12a09a389bda500ed6f4e2acb62ab3e1d906562ff2512c25c16d')

prepare() {
  cd Bibata_Extra_Cursor-$pkgver
  mkdir -p bitmaps
  bsdtar -xf "$srcdir/$pkgname-bitmaps-$pkgver.zip" -C bitmaps/

  rm -rf themes
}

build() {
  cd Bibata_Extra_Cursor-$pkgver

  pushd builder
  make build_unix
  popd
}

package() {
  cd Bibata_Extra_Cursor-$pkgver
  install -d "$pkgdir"/usr/share/icons
  cp -r themes/Bibata-* "$pkgdir"/usr/share/icons/
}
