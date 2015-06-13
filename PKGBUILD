# Contributor: uastasi <uastasi@archlinux.us>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Maintainer: SanskritFritz (gmail)

_pkg=pidgin-libnotify
pkgname=$_pkg-notify-osd
pkgver=0.14
pkgrel=6
pkgdesc="Patched pidgin-libnotify version for notify-osd"
arch=('i686' 'x86_64')
url="http://gaim-libnotify.sourceforge.net/"
license=('GPL')
depends=('pidgin' 'libnotify' 'perl-xml-parser' 'gettext')
makedepends=('intltool')
provides=('pidgin-libnotify')
conflicts=('pidgin-libnotify' 'pidgin-libnotify-ubuntu')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/gaim-libnotify/$_pkg-$pkgver.tar.gz"
        "$pkgname.patch"
	"language_fixes.patch")

md5sums=('bfb5368b69c02d429b2b17c00a6673c0'
         'e77341ecd8a9da3720c91e38781e72ae'
         'e9bdbb3c7faa61f062fc64277457b6c0')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  ## Enable support for notify-osd
  patch -p1 -i ../$pkgname.patch
  ## Enable more languages support
  patch -p1 -i "$srcdir/language_fixes.patch"

  ./configure --prefix=/usr \
              --disable-deprecated \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  make DESTDIR="$pkgdir" install
}
