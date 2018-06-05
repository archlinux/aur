# Maintainer : jyantis <yantis@yantis.net>
# Contributor: jjdanimoth <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="emerald-themes"

pkgname=emerald-themes-git
pkgver=0.8.14.r4.gb81f5f9
pkgrel=1
pkgdesc="Themes for emerald"
arch=('any')
url="https://gitlab.com/compiz/${_upstream}"
license=('GPL')
depends=('emerald')
makedepends=('intltool' 'pkgconfig')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
conflicts=('emerald-themes')
provides=('emerald-themes')
source=(
	"git+https://gitlab.com/compiz/${_upstream}.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_upstream}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr 
  make
}

package() {
  cd "${srcdir}/${_upstream}"
  make DESTDIR=${pkgdir} install 
}
