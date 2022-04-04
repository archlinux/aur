# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=fsniper-git
_pkgname=fsniper
pkgver=r240.8bec021
pkgrel=1
pkgdesc='Daemon to run scripts based on changes in files monitored by inotify (git)'
url='https://github.com/projectivemotion/fsniper'
license=('GPL3')
depends=('pcre' 'file')
provides=(fsniper)
conflicts=(fsniper)
makedepends=('git')
makedepends=('autoconf' 'automake' 'libtool' 'gcc')
source=("git+https://github.com/projectivemotion/fsniper")
sha256sums=('SKIP')
arch=('i686' 'x86_64')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/${_pkgname}"
  aclocal
  autoconf
  autoheader
  automake --add-missing
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR=${pkgdir} install
  install -m644 -D ${srcdir}/${_pkgname}/README \
                   ${pkgdir}/usr/share/doc/${pkgname}/README
  install -m644 -D ${srcdir}/${_pkgname}/example.conf \
                   ${pkgdir}/usr/share/doc/${pkgname}/example.conf
}

# vim:set ts=2 sw=2 ft=sh et:
