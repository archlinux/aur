# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: lspci <agm2819 at gmail dot com>
# Contributor: Mario Blättermann <mariobl@gnome.org>

pkgname=wmweather+-git
_pkgname=wmweather+
pkgver=r72.98823ac
pkgrel=1
pkgdesc="Downloads the National Weather Service METAR bulletins, ANV and MRF forecasts, and any weather map for display in a WindowMaker dockapp"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/wmweatherplus"
license=('GPL')
groups=('x11')
depends=('pcre' 'libxpm' 'curl' 'windowmaker-crm-git')
provides=(${_pkgname})
conflicts=(${_pkgname})
makedepends=('git')
source=("http://downloads.sf.net/wmweatherplus/$pkgname-$pkgver.tar.gz")
md5sums=('5eea25d708abe1da3549672b898bd0d4')
source=("$pkgname::git://git.code.sf.net/p/wmweatherplus/git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
