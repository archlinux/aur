# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=gtk2-smooth-engine
pkgver=0.6.0.1
_spkgver=0.5.8
pkgrel=5
pkgdesc="Smooth themes for gtk2 without the need for gtk1"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/smooth-engine"
license=('LGPL')
depends=('gtk-engines')
replaces=('gtk-smooth-engine')
conflicts=('gtk-smooth-engine')
options=('!libtool')
source=(http://downloads.sourceforge.net/smooth-engine/gtk-smooth-engine-$pkgver.tar.gz \
        http://downloads.sourceforge.net/smooth-engine/smooth-themes-$_spkgver.tar.gz \
	deprecated_macros.diff free_border.diff careless.diff)

build() {
  cd "$srcdir"/gtk-smooth-engine-$pkgver
  sed -i -e 's/-DGDK_DISABLE_DEPRECATED//' engines/gtk2/Makefile.in

  patch -Np1 -i "$srcdir"/deprecated_macros.diff
  patch -Np1 -i "$srcdir"/free_border.diff
  patch -Np1 -i "$srcdir"/careless.diff
  ./configure --prefix=/usr --enable-gtk-2 --disable-gtk-1
  make

  cd "$srcdir"/smooth-themes-$_spkgver
  ./configure --prefix=/usr --enable-gtk-2 --disable-gtk-1
  make
}

package() {
  cd "$srcdir"/gtk-smooth-engine-$pkgver
  make DESTDIR="$pkgdir" install

  cd "$srcdir"/smooth-themes-$_spkgver
  make DESTDIR="$pkgdir" install
}
md5sums=('a2231118c8187649d1e634fdfe6f36de' 'a46c592261c4d371498d644eece6493e' 'f2fcb7c088735ff0f07915987097755b' 'd018dc9be612514fc921bb12fd7d7070' 'ddebde49a8db05578b3c561bfa8b34f9')
