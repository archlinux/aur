# Maintainer: Pablo Lezaeta <prflr 88 (arro'a) gmail puntocom>

pkgname=epdfview-git
pkgver=0.1.8.r49
pkgrel=1
pkgdesc="Lightweight PDF document viewer"
arch=('i686' 'x86_64')
url="http://freecode.com/projects/epdfview"
license=('GPL2')
depends=('desktop-file-utils' 'gtk2' 'hicolor-icon-theme' 'poppler-glib')
makedepends=('git' 'pkg-config')
provides=('epdfview')
conflicts=('epdfview')
source=("${pkgname}::git+https://github.com/jristz/epdfview.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  echo $(git describe --always --abbrev=0).r$(git rev-list --count master) | sed 's|-|.|g' | sed 's|v||g'
}

build() {
  cd "${srcdir}/${pkgname}"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="$pkgdir" install
}
