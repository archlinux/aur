# Maintainer:
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=ekg2
pkgver=20140406
pkgrel=1
pkgdesc='Ncurses based Jabber, Gadu-Gadu, Tlen and IRC client'
arch=('i686' 'x86_64')
url='http://ekg2.org/'
license=('GPL')
depends=('aspell' 'libjpeg' 'python2' 'libgadu' 'gnutls' 'gpm' 'libidn' 'giflib')
optdepends=('xosd: xosd support'
	    'sqlite: sqlite support'
            'gtk2: gtk support')
source=('https://github.com/jnbek/ekg2/archive/20140406.tar.gz')
md5sums=('df3cbe4a4b72513423765d8408b13e69')

#prepare() {
#  cd $pkgname-$pkgver
#  sed -i 's|ncursesw/ncurses.h|ncurses.h|g' configure plugins/ncurses/ecurses.h
#  patch -Np1 -i ../ekg2-0.3.1-giflib5.patch
#}

build() {
  cd $pkgname-$pkgver

  export PYTHON=/usr/bin/python2
  ./autogen.sh
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/ekg2 \
    --enable-shared

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir"/usr/lib/perl5/core_perl/perllocal.pod
  rm -rf "$pkgdir"/usr/libexec
  chmod -R 755 "$pkgdir"/usr/lib/perl5
}

# vim:set ts=2 sw=2 et:
