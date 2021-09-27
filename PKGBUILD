# $Id$
# Maintainer: John Lane <archlinux@jelmail.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Adam Vogt <vogt.adam@gmail.com>

pkgname=dtach-git
pkgver=r46.748020b
pkgrel=1
pkgdesc="emulates the detach feature of screen"
arch=('i686' 'x86_64')
url="http://dtach.sourceforge.net/"
license=('GPL')
depends=('glibc')
provides=('dtach')
conflicts=('dtach')
source=(${pkgname}::git+https://github.com/crigler/dtach.git)
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"

  ./configure CFLAGS="$CFLAGS -Wno-unused-result" --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 dtach "${pkgdir}/usr/bin/dtach"
  install -Dm644 dtach.1 "${pkgdir}/usr/share/man/man1/dtach.1"
}

pkgver() {
        cd "${srcdir}/${pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
