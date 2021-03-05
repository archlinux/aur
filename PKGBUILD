# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard
pkgver=3.0.3
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
source=($pkgname-$pkgver-tar.gz::https://github.com/tuxedocomputers/tuxedo-keyboard/archive/v${pkgver}.tar.gz tuxedo_io.conf)
sha256sums=('211fbaecdd3f5fbf0baa04ec1af65fd33534fa37d42da5f54204afeed56e44e3'
            'd94d305bfd2767ad047bc25cc5ce986e76804e7376c3dd4d8e500ebe2c7bef3c')
sha512sums=('6ebbde6ea9351f9fd7167d38d8b5f836d1fda2fbbcf80755e86c2b76c49cf263ad2e9cfc47bea3449387626d88d8c1725335c2861ec2ff5a76e64ef87e27d9fb'
            '3101d1063e9c45eccb505fa21578cba33ae5c85b3d5b1c62c90806ad9d7b04410c91ded7a7115a85d1f6ecbd90ccc9e5f2ecf269dac4a557baa017a629bbcf81')

package() {
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/tuxedo_keyboard.conf "${pkgdir}/etc/modprobe.d/tuxedo_keyboard.conf"
  install -Dm644 "${srcdir}"/tuxedo_io.conf "${pkgdir}/etc/modules-load.d/tuxedo_io.conf"
}
