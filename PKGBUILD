# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

pkgname=gopherus
pkgver=1.1
pkgrel=1
pkgdesc="Gopher client"
arch=('i686' 'x86_64')
url="http://gopherus.sourceforge.net"
license=('BSD')
depends=('ncurses')
optdepends=('sdl2')
source=(http://downloads.sourceforge.net/project/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.xz
        gopherus.desktop)
sha256sums=('ad69c9ba0d7ca568038bc0cf04e48847b61d39b766a4b937a3230ffcd7727331'
            'b01f1fa220cb788edf5c743a35aeff169f62eefee19d5f6dee96274e8c8cfd21')

build() {
  cd "${pkgname}-${pkgver}"
  make -f Makefile.lin CFLAGS="${CFLAGS}"
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/bin"
  install -m755 gopherus gopherus-sdl "${pkgdir}/usr/bin"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 gopherus.txt history.txt \
   "${pkgdir}/usr/share/doc/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  (
    cd "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/gopherus.txt LICENSE
  )

  install -Dm644 icon.svg \
   "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  install -Dm644 "${srcdir}/gopherus.desktop" \
   "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
