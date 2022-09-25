# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: fenugrec <fenugrec at users sourceforge org>
# Contributor: rabyte <rabyte__gmail>

pkgname=vspcplay
pkgver=1.4
pkgrel=1
pkgdesc='A terminal-based visual SNES sound file (SPC) player and optimisation tool'
arch=('x86_64')
url='http://vspcplay.raphnet.net/'
license=('GPL2')
depends=('sdl')
conflicts=('vspcplay-git')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/raphnet/vspcplay/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  'ec9b327ec5ad4e3c8493e9e0ef0dd0d9983904da88be9a33d83d5360050d96b1b22b1fa06d3871456d2f85b56c8ab27e5df4e73e2a027152956ba25918109e7d'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make CC="gcc ${CFLAGS}" LD="\$(CPP) ${LDFLAGS}"
  cd utils
  make CC="gcc ${CFLAGS} ${LDFLAGS}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 vspcplay utils/applymask32 "${pkgdir}/usr/bin/"
  install -Dm644 vspcplay-icon.ico "${pkgdir}/usr/share/pixmaps/vspcplay.ico"
}
