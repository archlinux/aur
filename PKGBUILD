# Maintainer: Alberto Sánchez Molero <alsamolero@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=libpqxx-git
_gitname=libpqxx
pkgver=5.0.1.r1.80a9d538
pkgrel=1
pkgdesc="C++ client API for PostgreSQL"
arch=('i686' 'x86_64')
license=('custom')
url="https://github.com/jtv/libpqxx"
depends=('postgresql-libs>=9.1')
makedepends=('python2')
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
  sed -i 's|python|python2|' tools/splitconfig
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make prefix="${pkgdir}/usr" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
