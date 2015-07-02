# Maintainer: 3ED <krzysztof1987 _at_ gmail _dot_ com>

pkgname=milena-abc
pkgver=0.3.65
pkgrel=1
pkgdesc="Gtk3 gui for audiobook creator from Milena speech synthesizer"
arch=('i686' 'x86_64')
url="http://milena.polip.com/"
license=('GPL')
depends=(milena libwebkit3 gtksourceview3 faac mpg123 libsamplerate curl)
source=(http://tts.polip.com/files/${pkgname//-/_}-${pkgver}.tar.gz)
sha256sums=('dc19f33e3a2190e0d6c92ee1f18ff5c79ae71c5e25213fa432e119e009f3b25a')

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
