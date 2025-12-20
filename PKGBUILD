# vim: sw=2 ts=2 et
#
# Maintainer: Tilman BLUMENBACH <tilman+aur@ax86.net>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Cory Farmer <rbgkofi@ameritech.net>
#
pkgname=vorbisgain
pkgver=0.37
pkgrel=7
pkgdesc="A utility that computes the ReplayGain values for Ogg Vorbis files."
arch=('x86_64')
url="https://sjeng.org/vorbisgain.html"
license=('LGPL-2.1-only')
depends=('libvorbis')
source=(
  "https://sjeng.org/ftp/vorbis/${pkgname}-${pkgver}.tar.gz"
  fix-compile-errors.patch
)

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir?}/fix-compile-errors.patch"
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
    --enable-recursive \
    --mandir=/usr/share/man
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

sha256sums=('dd6db051cad972bcac25d47b4a9e40e217bb548a1f16328eddbb4e66613530ec'
            'f40e30ace24081be9ec085f7332511b3ff0e16115a6e1bc3514229b2ba455ec0')
