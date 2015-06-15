# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=tint2-git
_pkgname=tint2
pkgrel=1
pkgver=v0.12.rc6.r8.ge7cfa35
pkgdesc="Tint2 git official release"
arch=('i686' 'x86_64')
url="https://gitlab.com/o9000/tint2"
license=('GPL')
depends=('libxcomposite' 'libxinerama' 'libxrandr' 'pango' 'imlib2' 'startup-notification' 'librsvg' 'gtk2')
makedepends=('cmake' 'pkg-config')
options=('!libtool')
provides=('tint2')
conflicts=('tint2' 'tint' 'tint2-svn' 'tint2-beta')
source="git+https://gitlab.com/o9000/tint2.git"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
 # migrated to /usr/bin/python2 
 #sed -i 's/\#\!\/usr\/bin\/env python/\#\!\/usr\/bin\/env python2/g' "$srcdir/$_pkgname/src/tint2conf/tintwizard.py"
 cd "$srcdir/$_pkgname"
 cmake . -DCMAKE_INSTALL_PREFIX=/usr 
 # enabled by default 
 # -DENABLE_TINT2CONF=1
 make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
