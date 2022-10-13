# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard-dkms
pkgver=3.1.0
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
sha256sums=('a2a37968367b5066d943a8432c49440e25e999a5b00959689d0abf8103c7709c'
            'd94d305bfd2767ad047bc25cc5ce986e76804e7376c3dd4d8e500ebe2c7bef3c')
sha512sums=('d304cc01d5a033dbb76276bc3dae4ba37462b6c38bc50a07a81e6bcd0aa455ca8aac1af9bc435f61017c7d0feb2a6623d15a81cc2c388e2bf34f3c22aba3f67b'
            '3101d1063e9c45eccb505fa21578cba33ae5c85b3d5b1c62c90806ad9d7b04410c91ded7a7115a85d1f6ecbd90ccc9e5f2ecf269dac4a557baa017a629bbcf81')

package() {
  mkdir -p "${pkgdir}/usr/src/tuxedo-keyboard-${pkgver}"
  cp -r "${srcdir}/tuxedo-keyboard-${pkgver}"/* "${pkgdir}/usr/src/tuxedo-keyboard-${pkgver}"
  install -Dm644 "${srcdir}/tuxedo-keyboard-${pkgver}"/tuxedo_keyboard.conf "${pkgdir}/etc/modprobe.d/tuxedo_keyboard.conf"
  install -Dm644 "${srcdir}"/tuxedo_io.conf "${pkgdir}/etc/modules-load.d/tuxedo_io.conf"
}
