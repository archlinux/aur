# Maintainer : jyantis <yantis@yantis.net>
# Contributor: jjdanimoth <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=emerald-themes-git
pkgver=0.8.10.r0.g4211335
pkgrel=1
pkgdesc="Themes for emerald"
arch=('any')
url="http://git.northfield.ws/compiz/?p=compiz/emerald-themes;a=summary"
license=('GPL')
depends=('emerald')
makedepends=('intltool' 'pkgconfig')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
conflicts=('emerald-themes')
provides=('emerald-themes')
source=(
	'git://northfield.ws/compiz/emerald-themes'
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%%-git}"
  ./autogen.sh 
  ./configure --prefix=/usr 
  make
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  make DESTDIR=${pkgdir} install 
}
