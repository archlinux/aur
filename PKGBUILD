# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=('enchant-pure')

_pkgname=enchant
pkgver=1.6.0
pkgrel=3

pkgdesc="A wrapper library for pure and generic spell checking for all languages, supporting Aspell and Myspell/Hunspell engines"
url="http://www.abisource.com/enchant/"

arch=('any')
license=('LGPL')

depends=('aspell>=0.50.0' 'dbus-glib>=0.62' 'hunspell')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!libtool')

source=("http://www.abisource.com/downloads/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	"warnings-fix.patch")
sha1sums=('321f9cf0abfa1937401676ce60976d8779c39536'
          '8e23f2b350e77c2a2e9accf1ce1b9a18aefb69ff')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ../warnings-fix.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static --disable-ispell --disable-hspell --with-myspell-dir=/usr/share/myspell
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

