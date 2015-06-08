# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=tint2-git
_pkgname=tint2
_buildpkgname=tint2.git
pkgver=0.12.rc5
_pkgver=0.12-rc5
pkgrel=2
pkgdesc="Tint2 git official release"
arch=('i686' 'x86_64')
url="https://gitlab.com/o9000/tint2"
license=('GPL')
depends=('libxcomposite' 'libxinerama' 'libxrandr' 'pango' 'imlib2' 'startup-notification' 'librsvg' 'gtk2')
makedepends=('cmake' 'pkg-config')
options=('!libtool')
provides=('tint2')
conflicts=('tint2' 'tint' 'tint2-svn')
source="https://gitlab.com/o9000/$_pkgname/repository/archive.tar.gz?ref=v$_pkgver"
md5sums=('03bf7f9a8b8e3cd57cb0b22f4cc52711')

build() {
 sed -i 's/\#\!\/usr\/bin\/env python/\#\!\/usr\/bin\/env python2/g' "$srcdir/$_buildpkgname/src/tint2conf/tintwizard.py"
 cd "$srcdir/$_buildpkgname"
 cmake . -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_TINT2CONF=1
 make
}

package() {
  cd "$srcdir/$_buildpkgname"
  make DESTDIR="$pkgdir" install
}
