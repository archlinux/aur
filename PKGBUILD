# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=atari++
pkgver=1.81
pkgrel=1
pkgdesc="An emulator of Atari 400/800/400XL/800XL/130XE/5200"
arch=('i686' 'x86_64')
url="http://www.xl-project.com"
license=('custom:TPL')
depends=('sdl' 'libpng' 'alsa-lib' 'gcc-libs' 'libsm') 
source=(${url}/download/${pkgname}_${pkgver}.tar.gz)
sha256sums=('afb1e136257acb179a9e31aa7e6497df78a8227e58fd433accb135a91b3262eb')
noextract=(${pkgname}_${pkgver}.tar.gz)

prepare() {
  cd "${srcdir}"
  tar xfz "${srcdir}/${pkgname}_${pkgver}.tar.gz"
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
