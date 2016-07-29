# Maintainer: yubimusubi

pkgname=vndc
pkgver=2
pkgrel=1
pkgdesc="vndc - VNDC is Not a Direct Clone (of VNDS ;P)"
# arch=('i686' 'x86_64')
arch=('x86_64')
url='https://github.com/chaoskagami/vndc'
license=('MIT')
depends=('sdl2_mixer' 'sdl2_image' 'sdl2_ttf')

source=(https://github.com/chaoskagami/vndc/archive/stable-${pkgver}.tar.gz)
md5sums=('9ea50d778b9a922179673aedbb06f0d8')

build() {
  cd "${srcdir}/${pkgname}-stable-${pkgver}"
  if [ "$CARCH" == "x86_64" ]; then
    ./build linux
  else
    ./build linux32
  fi
}

package() {
  if [ "$CARCH" == "x86_64" ]; then
    install -D -m755 "${srcdir}/${pkgname}-stable-${pkgver}/bin/${pkgname}.$CARCH" "${pkgdir}/usr/bin/${pkgname}"
  else
    install -D -m755 "${srcdir}/${pkgname}-stable-${pkgver}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  fi

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  cd "${srcdir}/${pkgname}-stable-${pkgver}"
  install -m644 README.md LICENSE "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
