# $Id$
# Maintainer: Anh Tuan Nguyen < anhtuann2017 at gmail >

pkgname=ibus-unikey-git
pkgver=0.6.1.r21.6021e70
pkgrel=1
pkgdesc='IBus module for Vietnamese Keyboard from git master'
arch=('i686' 'x86_64')
url='https://github.com/Ubuntu-VN/ibus-unikey'
license=('GPLv3')
makedepends=('git' 'intltool')
depends=('ibus')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/Ubuntu-VN/ibus-unikey/")

pkgver() {
	cd "$srcdir/${pkgname}"
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
