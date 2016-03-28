# Maintainer : jyantis <yantis@yantis.net>
# Contributor: jjdanimoth <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=emerald-themes-git
pkgver=0.8.12.r1.gaf8d88f
pkgrel=1
pkgdesc="Themes for emerald"
arch=('any')
url="https://github.com/compiz-reloaded/emerald-themes"
license=('GPL')
depends=('emerald')
makedepends=('intltool' 'pkgconfig')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
conflicts=('emerald-themes')
provides=('emerald-themes')
source=(
	'git+https://github.com/compiz-reloaded/emerald-themes.git'
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
