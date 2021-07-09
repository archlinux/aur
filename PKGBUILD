# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard
pkgver=3.0.8
pkgrel=1
pkgdesc="Keyboard Backlight Driver from TUXEDO Computers"
url="https://github.com/tuxedocomputers/tuxedo-keyboard"
license=("GPL3")
arch=('x86_64') 
depends=('dkms')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
provides=('tuxedo-keyboard' 'tuxedo-io')
conflicts=('tuxedo-cc-wmi')
replaces=('tuxedo-cc-wmi')
backup=(etc/modprobe.d/tuxedo_keyboard.conf)
source=($pkgname-$pkgver.tar.gz::https://github.com/tuxedocomputers/tuxedo-keyboard/archive/v${pkgver}.tar.gz tuxedo_io.conf)
sha256sums=('a2298eef073b11cbe0cd5fc18db0b76eab17d679818748a013be568b1be75110'
            'd94d305bfd2767ad047bc25cc5ce986e76804e7376c3dd4d8e500ebe2c7bef3c')
sha512sums=('f564980b8a353f9b6d6121f3b9d4408e7ab1b26d5587cedbe85acac8a93779af1be1b224927fa0f2a25ee50e6b1c6dd8401949fd54a6e89c1304ae057c777e7c'
            '3101d1063e9c45eccb505fa21578cba33ae5c85b3d5b1c62c90806ad9d7b04410c91ded7a7115a85d1f6ecbd90ccc9e5f2ecf269dac4a557baa017a629bbcf81')

package() {
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/tuxedo_keyboard.conf "${pkgdir}/etc/modprobe.d/tuxedo_keyboard.conf"
  install -Dm644 "${srcdir}"/tuxedo_io.conf "${pkgdir}/etc/modules-load.d/tuxedo_io.conf"
}
