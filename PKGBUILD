# Maintainer: Christoph J. Thompson <thompsonc at protonmail dot ch>

pkgname=gopherus
pkgver=1.0c
pkgrel=3
pkgdesc="Gopher client"
arch=('i686' 'x86_64')
url="http://gopherus.sourceforge.net"
license=('GPL3')
depends=('ncurses')
optdepends=('sdl2')
source=(http://downloads.sourceforge.net/project/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        gopherus.desktop)
sha256sums=('84f5192659658bb57f6d77609654e74f9e96f7596c0e3ae10e707877d1cebaf4'
            'b01f1fa220cb788edf5c743a35aeff169f62eefee19d5f6dee96274e8c8cfd21')

build() {
  cd "${pkgname}-${pkgver}"
  sed -i '/upx --best --lzma/d' Makefile.lin
  make -f Makefile.lin CFLAGS="${CFLAGS}"
  make -f Makefile.lin gopherus-sdl CFLAGS="${CFLAGS}"
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/bin"
  install -m755 gopherus gopherus-sdl "${pkgdir}/usr/bin"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 gopherus.txt history.txt \
   "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm644 icon.svg \
   "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  install -Dm644 "${srcdir}/gopherus.desktop" \
   "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

