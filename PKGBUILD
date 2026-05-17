# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Baptiste Daroussin <baptiste.daroussin@gmail.com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>
# Contributor: mightyjaym <jm.ambrosino@free.fr>

_pkgbasename=giflib
pkgname=lib32-$_pkgbasename
pkgver=6.1.3
pkgrel=1
pkgdesc='Library for reading and writing gif images'
url='http://giflib.sourceforge.net/'
arch=('x86_64')
license=('MIT')
depends=('lib32-glibc' $_pkgbasename)
makedepends=(
  'docbook-xsl'
  'docbook-xml'
  'git'
  'imagemagick'
  'xmlto'
)
source=("${pkgname}::git+https://git.code.sf.net/p/giflib/code#tag=${pkgver}")
sha512sums=('8d2c425c9a5ae4f1ad00d302bf485148f67d7c29f6065e525c971808747a337015c34a79e331218300f601e256bc16ff68ccd051ebeb4a111a68a99d5c7a93d2')

build() {
  cd ${pkgname}
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  make CC="gcc -m32"
}

check() {
  cd ${pkgname}
  make check
}

package() {
  cd ${pkgname}
  make PREFIX=/usr LIBDIR=/usr/lib32 DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/usr/{include,share,bin}
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
