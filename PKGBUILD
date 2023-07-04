# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard-dkms
pkgver=3.2.7
pkgrel=1
pkgdesc="Keyboard Backlight Driver from TUXEDO Computers"
url="https://github.com/tuxedocomputers/tuxedo-keyboard"
license=("GPL3")
arch=('x86_64') 
depends=('dkms')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel'
            'tuxedo-keyboard-ite-dkms: Required for models with per-key keyboard backlight (e.g. Polaris, Stellaris, XUX)')
provides=('tuxedo-keyboard' 'tuxedo-io')
conflicts=('tuxedo-cc-wmi' 'tuxedo-keyboard')
replaces=('tuxedo-cc-wmi' 'tuxedo-keyboard')
backup=(etc/modprobe.d/tuxedo_keyboard.conf)
source=($pkgname-$pkgver.tar.gz::https://github.com/tuxedocomputers/tuxedo-keyboard/archive/v${pkgver}.tar.gz tuxedo_io.conf)
sha256sums=('5948c4a7aca586426f9476b28f02c0ccf21f59615f5edcac58ef8aa00c1dc276'
            'd94d305bfd2767ad047bc25cc5ce986e76804e7376c3dd4d8e500ebe2c7bef3c')
sha512sums=('64c2f2712dbff6a97d9fd8b071a7736eaa86e6783bb13a84d7172e2413c1048d6c6aa6af5f15f51d324d52fa79150b2a4e46220cc334d763c72c728efe54a69a'
            '3101d1063e9c45eccb505fa21578cba33ae5c85b3d5b1c62c90806ad9d7b04410c91ded7a7115a85d1f6ecbd90ccc9e5f2ecf269dac4a557baa017a629bbcf81')

package() {
  mkdir -p "${pkgdir}/usr/src/tuxedo-keyboard-${pkgver}"
  cp -r "${srcdir}/tuxedo-keyboard-${pkgver}"/* "${pkgdir}/usr/src/tuxedo-keyboard-${pkgver}"
  install -Dm644 "${srcdir}/tuxedo-keyboard-${pkgver}"/tuxedo_keyboard.conf "${pkgdir}/etc/modprobe.d/tuxedo_keyboard.conf"
  install -Dm644 "${srcdir}"/tuxedo_io.conf "${pkgdir}/etc/modules-load.d/tuxedo_io.conf"
}
