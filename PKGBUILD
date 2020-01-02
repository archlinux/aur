# Maintainer: Srevin Saju <srevin03@gmail.com>

pkgname=sugar3-artwork
pkgver=0.116
pkgrel=3
pkgdesc="Sugar icons and themes"
arch=('x86_64')
url="https://sugarlabs.org/"
license=('LGPL')
makedepends=('gtk2' 'gtk3' 'icon-naming-utils' 'python' 'xorg-xcursorgen')
optdepends=('gtk2: GTK+ 2 theme'
            'gtk3: GTK+ 3 theme')
source=(https://github.com/sugarlabs/sugar-artwork/archive/v$pkgver.tar.gz)
sha256sums=('bd0be61852edc9161431ef966ac915ad8c39cfe82ff995b481d80333fd3479f0')

build() {
  cd sugar-artwork-$pkgver
  chmod +x ./autogen.sh
  ./autogen.sh --prefix=/usr
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd sugar-artwork-$pkgver
  make DESTDIR="$pkgdir" install
}
