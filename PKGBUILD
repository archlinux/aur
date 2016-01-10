# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=adanaxis-gpl
_name=adanaxisgpl
pkgver=1.2.5
pkgrel=1
pkgdesc="A deep space first-person shooter game in four spatial dimensions (GPL version, built from source)"
arch=("i686" "x86_64")
url="http://www.mushware.com/portal.php"
license=('GPL')
depends=("libx11" "libxext" "glu" "sdl" "sdl_mixer" "libvorbis" "libogg" "libtiff" "pcre" "expat")
conflicts=("adanaxis-gpl-deb")
install=
source=("http://www.mushware.com/files/${_name}-$pkgver.tar.gz"
        "gcc-4.7.patch"
        "const.patch")
md5sums=('bd890ac60c875f7b114d722d16d5eb71'
         '0d9367d86a34c78a107bf775d8b4ee2a'
         'dc66d718ae4389b5e02fa9238b33710e')

prepare() {
  cd "$srcdir/${_name}-$pkgver"
  # Required to build with gcc>=4.7, see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=667094
  patch -p1 -i "$srcdir/gcc-4.7.patch"
  # Constness issue
  patch -p1 -i "$srcdir/const.patch"
}

build() {
  cd "$srcdir/${_name}-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_name}-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
