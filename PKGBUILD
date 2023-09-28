# Maintainer: Sergio "diedbydisgust" Cabrera Falcon <sergio.cabrerafalcon@gmail.com>
# Previous Maintainer: Alberto Sánchez Molero <alsamolero@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=libpqxx-git
_gitname=libpqxx
pkgver=7.8.1.r8.75868467
pkgrel=1
pkgdesc="C++ client API for PostgreSQL"
arch=('i686' 'x86_64')
license=('BSD 3-Clause')
url="https://github.com/jtv/libpqxx"
depends=('postgresql-libs>=9.1')
provides=('libpqxx')
conflicts=('libpqxx')
source=("git+https://github.com/jtv/libpqxx.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "%s" "$(git describe --long --tag | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${_gitname}"
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make prefix="${pkgdir}/usr" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
