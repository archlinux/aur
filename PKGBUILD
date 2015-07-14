pkgname=acr-git
pkgver=20150714.104.125ba72
pkgrel=1
pkgdesc="A fully compatible autoconf replacement" 
arch=('any')
url="http://nopcode.org"
license=('GPL')
depends=('sh')
makedepends=('git')
provides=('acr')
conflicts=('acr' 'acr-hg')

source=("$pkgname"::"git://github.com/radare/acr.git")
md5sums=('SKIP')

pkgver () {
	_date=`date +"%Y%m%d"`
	cd "${srcdir}/${pkgname}"
	echo "$_date.$(git rev-list --count master).$(git rev-parse --short master)"
}

build() {
  cd "${srcdir}/${pkgname}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
