# Maintainer : zoe <chp321 at gmail dot com>
# Contributor: Josef Lusticky <evramp@gmail.com>

pkgname=tintii
pkgver=2.10.0
pkgrel=3
pkgdesc="A smart photo filter for striking colour select effects"
arch=(i686 x86_64)
url="http://www.indii.org/software/${pkgname}"
license=('GPL')
depends=('wxgtk' 'desktop-file-utils')
makedepends=('boost')
source=("http://www.indii.org/files/tint/releases/${pkgname}-${pkgver}.tar.gz"
        "https://cloud.githubusercontent.com/assets/7050624/7840461/bb2a9cfa-0497-11e5-9c4a-f9cf13815547.png"
        "${pkgname}.desktop")
md5sums=('041fb49a44472c55d421e9771e40532b'
         'a135309f20688645df5aa26ca3310705'
         'f0dd9d57747d24b55547fc3e5c1ba4ec')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install

  # desktop file
  install -Dm644 ../${pkgname}.desktop \
    "$pkgdir/usr/share/applications/${pkgname}.desktop"

  # icon
  install -Dm644 ../bb2a9cfa-0497-11e5-9c4a-f9cf13815547.png \
    "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}

