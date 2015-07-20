# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=jed
pkgver=0.99.19
_pkgver=0.99-19
pkgrel=2
pkgdesc="A freely available text editor for Unix and others OS"
arch=('i686' 'x86_64')
url="http://www.jedsoft.org/jed"
license=('GPL')
depends=('gpm' 'slang' 'libxft')
makedepends=('libxext' 'libxt')
options=('!makeflags')
source=("ftp://space.mit.edu/pub/davis/${pkgname}/v0.99/${pkgname}-${_pkgver}.tar.bz2")
md5sums=('c9b2f58a3defc6f61faa1ce7d6d629ea')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  ./configure --prefix=/usr JED_ROOT=/usr/share/jed

  sed \
	-e "s_\(^all.*\)_\1 xjed rgrep_" \
	-e "s_..DEST.*doc_${pkgdir}/usr/share/doc/${pkgname}_g" \
	-i src/Makefile

  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  make DESTDIR="${pkgdir}" install

  # Install rgrep
  install -Dm755 src/objs/rgrep "$pkgdir/usr/bin"
}
