# Contributor: Amiad <amiadb at gmail dot com>
_pkgname=geany
pkgname=geany-gtk2-git
pkgver=1.37.1.r0.g26f4813f0
pkgrel=1
pkgdesc="Fast and lightweight IDE (git version)"
arch=('x86_64' 'i686')
url="http://github.com/geany/geany"
license=('GPL2')
depends=('gtk2' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git' 'automake' 'autoconf' 'intltool')
conflicts=('geany')
provides=('geany')

source=("${pkgname}"::"git+https://github.com/geany/geany.git#branch=1.37")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh --prefix=/usr --disable-html-docs --enable-gtk2
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
