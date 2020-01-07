# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard
pkgver=2.0.0
pkgrel=11
pkgdesc="Keyboard Backlight Driver from TUXEDO Computers"
url="https://github.com/tuxedocomputers/tuxedo-keyboard"
license=("GPL")
arch=('x86_64') 
makedepends=('git')
depends=('dkms')
conflicts=('tuxedo-keyboard-dkms' 'tuxedo-wmi' 'tuxedo-wmi-dkms')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel')
replaces=('tuxedo-keyboard-dkms')
backup=(etc/modprobe.d/tuxedo_keyboard.conf)
source=('git+https://github.com/tuxedocomputers/tuxedo-keyboard.git' 'tuxedokeyboard.conf')
sha256sums=('SKIP' 'd22aadf76a400f38ddee7ce2fd7f8b14694bf1d402bfbb99e65133d122ccb0f8')
sha512sums=('SKIP' '8aef78240aacf4a5c15cfb648400750a17db3203d230d6a1f8a84b1db71f0bd0d65251690f6290d8707b771cf74c6f008b82c65b00220e8d3fa70153be65ade6')
package() {
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/${pkgname}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  sed -i "s/^KDIR.*$//g" "${pkgdir}/usr/src/${pkgname}-${pkgver}/Makefile"
  sed -i "s/KDIR/KERNELDIR/g" "${pkgdir}/usr/src/${pkgname}-${pkgver}/Makefile"
  install -D "${srcdir}/${pkgname}/dkms.conf" "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
  echo "Copy tuxedo_keyboard.conf to /etc/modprobe.d/tuxedo_keyboard.conf"
  install -Dm644 "${srcdir}/${pkgname}/tuxedo_keyboard.conf" "${pkgdir}/etc/modprobe.d/tuxedo_keyboard.conf"
  install -Dm644 ${srcdir}/tuxedokeyboard.conf ${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf
}
