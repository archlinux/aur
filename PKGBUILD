# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk> and patched by orelien <aurelien.foret@wanadoo.fr>

pkgname=tuxtype
pkgver=1.8.1
pkgrel=1
pkgdesc="An educational typing tutorial game starring Tux"
arch=('i686' 'x86_64')
url="http://tux4kids.alioth.debian.org/"
license=('GPL2')
depends=('audiofile' 'esound' 'libjpeg' 'libpng' 'libvorbis' 'sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'sdl_pango')
source=(http://pkgs.fedoraproject.org/repo/pkgs/tuxtype2/${pkgname}_w_fonts-${pkgver}.tar.gz/ce96616ba0c9e619ce0071a528301e94/${pkgname}_w_fonts-${pkgver}.tar.gz)
# old link requires login now - https://alioth.debian.org/frs/download.php/file/3270/${pkgname}_w_fonts-${pkgver}.tar.gz
sha256sums=('2687b858679b4f0b4f42204211d162234568198544bd95a9b71ec96e788d1481')

build() {
  cd "${srcdir}"/${pkgname}_w_fonts-${pkgver}

  ./configure --prefix=/usr --localstatedir=/usr/share/games --sysconfdir=/etc --without-rsvg
  make
}

package() {
  cd "${srcdir}"/${pkgname}_w_fonts-${pkgver}

  make DESTDIR="${pkgdir}" install

#icon + desktop files
  install -D -m644 "${srcdir}"/${pkgname}_w_fonts-${pkgver}/$pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -D -m644 "${srcdir}"/${pkgname}_w_fonts-${pkgver}/icon.png \
    "${pkgdir}"/usr/share/pixmaps/$pkgname.png
}
