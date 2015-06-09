# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=nano-latest
pkgver=2.3.5
pkgrel=1
pkgdesc="Pico editor clone with enhancements (Latest version)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.nano-editor.org"
depends=('ncurses' 'sh')
optdepends=('nano-syntax-highlighting-git: extra syntax highlighting files (AUR)')
backup=('etc/nanorc')
provides=('nano')
conflicts=('nano')
source=(http://www.nano-editor.org/dist/v2.3/nano-${pkgver}.tar.gz)
md5sums=('a771f6283ac1edee8e5486209910c829')

build() {
  cd ${srcdir}/nano-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-color --enable-nanorc --enable-utf8 \
    --disable-extra --disable-multibuffer --disable-speller \
    --disable-wrapping --disable-browser --disable-mouse --disable-nls
  make

  sed -i 's/^# set smooth/set smooth/g' doc/nanorc.sample
  sed -i 's/^# set const/set const/g' doc/nanorc.sample
  sed -i 's/^# set tabsize 8/set tabsize 4/g' doc/nanorc.sample
  sed -i 's/^# include/include/g' doc/nanorc.sample
}

package() {
  cd ${srcdir}/nano-${pkgver}
  make DESTDIR=${pkgdir} install-strip
  install -DTm644 ${srcdir}/nano-${pkgver}/doc/nanorc.sample ${pkgdir}/etc/nanorc
}
