# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard-dkms
pkgver=3.2.3
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
sha256sums=('dcad92d748e0d28ea0fb34d2933724e870f93509c816114d56f224d5abddc4bf'
            'd94d305bfd2767ad047bc25cc5ce986e76804e7376c3dd4d8e500ebe2c7bef3c')
sha512sums=('9f62c6c603d7aa0b4870c4786526d5f7aa6e96104820ecb00eeaf941ea11ac3ceee849189f6f1e09519c201ea89aca58c19374beb90b087ed347e60fe850fad5'
            '3101d1063e9c45eccb505fa21578cba33ae5c85b3d5b1c62c90806ad9d7b04410c91ded7a7115a85d1f6ecbd90ccc9e5f2ecf269dac4a557baa017a629bbcf81')

package() {
  mkdir -p "${pkgdir}/usr/src/tuxedo-keyboard-${pkgver}"
  cp -r "${srcdir}/tuxedo-keyboard-${pkgver}"/* "${pkgdir}/usr/src/tuxedo-keyboard-${pkgver}"
  install -Dm644 "${srcdir}/tuxedo-keyboard-${pkgver}"/tuxedo_keyboard.conf "${pkgdir}/etc/modprobe.d/tuxedo_keyboard.conf"
  install -Dm644 "${srcdir}"/tuxedo_io.conf "${pkgdir}/etc/modules-load.d/tuxedo_io.conf"
}
