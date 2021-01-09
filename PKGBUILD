# Maintainer:  Vincent Grande <shoobe420@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=libksba-git
pkgver=1.4.0
pkgrel=1
pkgdesc='Library for working with X.509 certificates, CMS data and related objects'
url='https://www.gnupg.org/related_software/libksba/'
license=('GPL')
arch=('x86_64')
depends=('bash' 'libgpg-error' 'glibc')
provides=(libksba)
conflicts=(libksba)
source=(git://git.gnupg.org/libksba.git)
sha256sums=('SKIP')
#validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6') # Werner Koch

pkgver() {
  cd libksba
  git describe --tags | sed 's/-/+/g'
}

build() {
	cd libksba
	./autogen.sh
	./configure --prefix=/usr --disable-doc
	make
}

#check() {
#	cd libksba
#	make check
#}  

package() {
	cd libksba
	make DESTDIR="${pkgdir}" install
}
