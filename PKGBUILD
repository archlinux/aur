# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard-dkms
pkgver=3.2.8
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
sha256sums=('4f3a6c6ec718c4abb51a37a9a9a37fbece92c8ba8b2e3020663048a1ac12c928'
            'd94d305bfd2767ad047bc25cc5ce986e76804e7376c3dd4d8e500ebe2c7bef3c')
sha512sums=('a37f73c8f92108c9f3cd82b5519202a41f9285e4b555e157bea038f65d8e876941e72b7b31180a9043f42ea2f184486579b650ecfd9c3a188acdaa6ba68b1c2a'
            '3101d1063e9c45eccb505fa21578cba33ae5c85b3d5b1c62c90806ad9d7b04410c91ded7a7115a85d1f6ecbd90ccc9e5f2ecf269dac4a557baa017a629bbcf81')

package() {
  mkdir -p "${pkgdir}/usr/src/tuxedo-keyboard-${pkgver}"
  cp -r "${srcdir}/tuxedo-keyboard-${pkgver}"/* "${pkgdir}/usr/src/tuxedo-keyboard-${pkgver}"
  install -Dm644 "${srcdir}/tuxedo-keyboard-${pkgver}"/tuxedo_keyboard.conf "${pkgdir}/etc/modprobe.d/tuxedo_keyboard.conf"
  install -Dm644 "${srcdir}"/tuxedo_io.conf "${pkgdir}/etc/modules-load.d/tuxedo_io.conf"
}
