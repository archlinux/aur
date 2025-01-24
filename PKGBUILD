# Maintainer: Shapiro <shapiro at quantentunnel dot de>

pkgname='veracrypt-inyourlanguage'
_pkgname='VeraCrypt'
pkgver=1.26.18
pkgrel=1
pkgdesc='Disk encryption with strong security based on TrueCrypt 7.1a. Supporting 40+ languages, changeable while running the program.'
url='https://www.veracrypt.fr'
arch=('x86_64' 'i686' 'arm64' 'armhf' 'aarch64')
license=('custom')
provides=('veracrypt')
conflicts=('veracrypt' 'veracrypt-console-bin' 'veracrypt-git' 'veracrypt-trans')
depends=('device-mapper' 'fuse2' 'libsm' 'wxwidgets-gtk3')
makedepends=('pcsclite' 'yasm')
source=(https://launchpad.net/veracrypt/trunk/${pkgver}/+download/${_pkgname}_${pkgver}_Source.tar.bz2)
sha512sums=('a049d349ef5e58706208dcc8573310222f62311bd0ba6890dd791801de7c1e7295fb7dfea5ac328fb258c02842956ae57b280bab3fddcbf7724fbbb432dfa4fa')

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

