# Maintainer: Oliver Jaksch <ojaksch@com-in.de>

pkgname=atari++
pkgver=1.73
pkgrel=1
pkgdesc="An emulator of Atari 400/800/400XL/800XL/130XE/5200"
arch=('i686' 'x86_64')
url="http://www.xl-project.com/"
license=('custom:TPL')
depends=('sdl' 'libpng' 'alsa-lib' 'gcc-libs' 'libsm') 
source=(${url}download/${pkgname}_${pkgver}.tar.gz)
md5sums=('13af66f605282f84ae33359e4c8d740a')
noextract=(${pkgname}_${pkgver}.tar.gz)

prepare() {
  cd "${srcdir}"
  tar xfz "../${pkgname}_${pkgver}.tar.gz"
}

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr
  make DESTDIR="${pkgdir}" || return 1
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install || return 1
  install -m644 -D README.licence ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
