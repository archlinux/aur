# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=geeqie-git
pkgver=20140927
pkgrel=2
pkgdesc="A lightweight image browser and viewer (fork of GQview)"
url="http://www.geeqie.org/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('gtk3' 'exiv2' 'lcms2')
optdepends=('lirc: remote control support'
	    'lua: uses it somehow if detected'
	    'doxygen: waste some hdd space on documentation')
makedepends=('git' 'intltool')
provides=('geeqie')
conflicts=('geeqie' 'gqview-devel')
source=("git+http://www.geeqie.org/git/geeqie.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/geeqie"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/geeqie"

  ## This might be needed on i686 or for a different gcc release
  ## Uncomment if required
  #CPPFLAGS="${CPPFLAGS} -D_FILE_OFFSET_BITS=64"

  ./autogen.sh --prefix=/usr \
               --sysconfdir=/etc \
               --disable-maintainer-mode \
               --disable-debug-log 
  make
}

package() {
  cd "$srcdir/geeqie"
  make DESTDIR="$pkgdir" install
}
