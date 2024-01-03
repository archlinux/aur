# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
_pkgname=tuxedo-drivers
pkgname=tuxedo-drivers-dkms
pkgver=4.0.3
pkgrel=1
pkgdesc="TUXEDO Computers kernel module drivers for keyboard, keyboard backlight & general hardware I/O using the SysFS interface"
url="https://github.com/tuxedocomputers/tuxedo-drivers"
license=("GPL3")
arch=('x86_64')
depends=('dkms')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
# tuxedo-keyboard-ite = ite_8291, ite_8291_lb, ite_8297 and ite_829x
provides=('tuxedo-keyboard'
          'tuxedo-keyboard-ite'
          'tuxedo-io'
          'clevo-wmi'
          'clevo-acpi'
          'uniwill-wmi'
          'ite_8291'
          'ite_8291_lb'
          'ite_8297'
          'ite_829x')
replaces=('tuxedo-keyboard-dkms' 'tuxedo-keyboard-ite-dkms')
#backup=(etc/modprobe.d/tuxedo_keyboard.conf)
source=($pkgname-$pkgver.tar.gz::https://github.com/tuxedocomputers/tuxedo-drivers/archive/v${pkgver}.tar.gz tuxedo_io.conf dkms.conf)
sha256sums=('fc9c5cb460db5a4b55b7fc0333654d7e3865a513ab178635e17c84fcce83a921'
            'd94d305bfd2767ad047bc25cc5ce986e76804e7376c3dd4d8e500ebe2c7bef3c'
            '41424829fbe55dbc44fb122699881d92fec44fc8d68a6de1bcbb9731b8c3cd64')
sha512sums=('7dace2a24abc1a26d5104160b4f991dbc8bf595a3c3dd9e6092f3f46968e6785acca1d440dfcf36d3c20719e30fba5c263ce160863c798b6f4a1a843ccc6af30'
            '3101d1063e9c45eccb505fa21578cba33ae5c85b3d5b1c62c90806ad9d7b04410c91ded7a7115a85d1f6ecbd90ccc9e5f2ecf269dac4a557baa017a629bbcf81'
            'c4d97aac8fd08497f4111f57ccfe7513b2172131ea8be61f5cc9d417bfc409c18286b270584215a2bf3ec1b1059008255ade87940eb151ce925c74a7184ee1f6')

package() {
  mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  sed -i "s/#MODULE_VERSION#/${pkgver}/" dkms.conf
  install -Dm644 dkms.conf -t "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  install -Dm644 "${_pkgname%}-$pkgver"/Makefile -t "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  install -Dm644 "${_pkgname%}-$pkgver"/tuxedo_keyboard.conf -t "$pkgdir/usr/lib/modprobe.d/"
  install -Dm644 "$srcdir/tuxedo_io.conf" -t "$pkgdir/usr/lib/modules-load.d/"
  #cp -avr "${_pkgname%}-$pkgver"/* "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  cp -avr "${_pkgname%}-$pkgver"/src/* "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
}
