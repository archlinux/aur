# Maintainer: Shapiro <shapiro at quantentunnel dot de>

pkgname='veracrypt-inyourlanguage'
_pkgname='VeraCrypt'
pkgver=1.26.29
pkgrel=1
pkgdesc='Disk encryption with strong security based on TrueCrypt 7.1a supporting 40+ languages.'
url='https://www.veracrypt.jp'
arch=('x86_64' 'i686' 'arm64' 'armhf' 'aarch64')
license=('Apache License 2.0 and TrueCrypt License 3.0')
provides=('veracrypt')
conflicts=('veracrypt' 'veracrypt-console-bin' 'veracrypt-git' 'veracrypt-trans')
depends=('device-mapper' 'fuse2' 'sudo' 'wxwidgets-gtk3')
makedepends=('pcsclite' 'yasm')
source=(https://launchpad.net/veracrypt/trunk/${pkgver}/+download/${_pkgname}_${pkgver}_Source.tar.bz2)

sha512sums=('A4A981DA258C5349AFD5BF55CA3863342FF4EBE6A0B8B1282C1D879F2EAAA2D040E55CAA7C159823C4C91AD45E507F852F39C302B713948019AFEBF86F2823EB')

build() {
  cd src
  make PKG_CONFIG_PATH=/usr/lib/pkgconfig WX_CONFIG=/usr/bin/wx-config
}

package() {
  cd src
  make DESTDIR="${pkgdir}/" install
  install -Dm 644 License.txt -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  echo "Installing language files..."
  install -d "${pkgdir}/usr/share/veracrypt/languages"
  install -Dm 644 ../Translations/* "${pkgdir}/usr/share/veracrypt/languages/"
  rm -r "${pkgdir}/usr/sbin"
  rm -r "${pkgdir}/usr/share/doc"
}
