# Maintainer: 3ED <krzysztof1987 _at_ gmail _dot_ com>

pkgname=milena-abc
pkgver=0.3.68
pkgrel=1
pkgdesc="Gtk3 gui for audiobook creator from Milena speech synthesizer"
arch=('i686' 'x86_64')
url="http://milena.polip.com/"
license=('GPL')
depends=(milena gtksourceview3 faac mpg123 libsamplerate curl)
source=(http://www.polip.com/files/${pkgname//-/_}-${pkgver}.tar.gz)
sha256sums=('b1f400f0b950e0d33cc05ee52dcf88b5f2d0bdc5c405eda3b7863229aa4c83c5')

build() {
  cd "$srcdir/${pkgname//-/_}-${pkgver}"

  ./configure --prefix=/usr 
  make

  # FIX: Bad place for icons, change from name to path.
  sed -e 's:^Icon=.*:Icon=/usr/share/icons/milena_abc.xpm:' \
      -i milena_abc.desktop
}

package() {
  cd "$srcdir/${pkgname//-/_}-${pkgver}"

  # FIX: "make install" should create this folders automaticly.
  install -dm755 "$pkgdir"/usr/{bin,share/{applications,icons,milena_abc}}

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
