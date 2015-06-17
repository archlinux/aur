# Maintainer: M0Rf30

pkgname=nightmode-git
_pkgname=nightmode
pkgver=1.5325650
pkgrel=1
pkgdesc="A kwin plugin that makes the entire screen darker."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Nightmode?content=123805"
license=('GPL')
makedepends=('git' 'cmake' 'automoc4' 'kdelibs')
depends=('kdebase-workspace')
provides=('nightmode')
conflicts=('nightmode')
source=("nightmode::git+https://github.com/M0Rf30/nightmode.git"
	"patch"	)


build() {
  cd "$srcdir/$_pkgname"
  patch -Np0 -i ../patch
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix)
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git rev-list --count HEAD).$(git describe --always)"
}

md5sums=('SKIP'
         '006039a049dee049b7e2007a2c05875e')
