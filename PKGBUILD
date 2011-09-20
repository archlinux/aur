# Author: Thomas Vander Stichele <thomas at apestaart dot org>
# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=morituri
pkgver=0.1.2
pkgrel=2
pkgdesc="a CD ripper aiming for accuracy over speed, modelled after Exact Audio Copy"
arch=(i686 x86_64)
url="https://thomas.apestaart.org/morituri/trac/"
license=("GPL3")
depends=("cddb-py" "cdparanoia" "cdrdao" "gstreamer0.10" "gstreamer0.10-python"
         "python-musicbrainz2")
optdepends=("python2-pycdio: for 'rip drive list'")
source=("http://thomas.apestaart.org/download/morituri/$pkgname-$pkgver.tar.bz2")
sha1sums=('e09b559ced4a0aeeb49c44b0dce1dcf2f7de50a8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export PYTHON="python2"
  sed -i '27s/\<python\>/&2/' doc/Makefile.am
  sed -i '1s/\<python\>/&2/' bin/rip.in etc/bash_completion.d/bash-compgen
  automake
  ./configure --prefix=/usr --sysconfdir=/etc 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm 0644 "README" "$pkgdir/usr/share/doc/morituri/README"
}

# vim: ft=sh:ts=2:sw=2:et
