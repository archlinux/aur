# $Id$
# Contributor: Olivier Mehani <shtrom-arch@ssji.net>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Lonfucius <Lonfucius@gmail.com>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=ibus-m17n-git
pkgver=1.3.4.r16.791efdd
pkgrel=1
pkgdesc='M17N engine for IBus from git master'
arch=('i686' 'x86_64')
url='http://code.google.com/p/ibus/'
license=('LGPL')
makedepends=('git')
depends=('python2-pyenchant' 'ibus' 'm17n-db' 'm17n-lib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/ibus/ibus-m17n/")

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
}

md5sums=('SKIP')
