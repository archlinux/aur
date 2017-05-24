# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Márcio Silva <coadde@parabola.nu>
# Contributor (Parabola): Luke Shumaker <lukeshu@sbcglobal.net>

pkgname=linux-libre-firmware
_pkgver=4.11-gnu

_srcname=linux-${_pkgver%-*}
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='Firmware files for Linux-libre'
arch=('any')
url='https://linux-libre.fsfla.org/'
license=('GPL2')
depends=('ath9k-htc-firmware' 'openfwwf')
provides=('linux-firmware')
conflicts=('linux-firmware'
           'linux-firmware-git'
           'kernel26-firmware'
           'ar9170-fw'
           'iwlwifi-1000-ucode'
           'iwlwifi-3945-ucode'
           'iwlwifi-4965-ucode'
           'iwlwifi-5000-ucode'
           'iwlwifi-5150-ucode'
           'iwlwifi-6000-ucode'
           'rt2870usb-fw'
           'rt2x00-rt61-fw'
           'rt2x00-rt71w-fw'
           'amd-ucode')
source=("https://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/linux-libre-${_pkgver}.tar.xz"
        "https://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/linux-libre-${_pkgver}.tar.xz.sign")
sha512sums=('f1d9138024b127385248de5c8eb72123b717bbbaba3e80bded20f073acac816a7ea979c4677ddc72252a8ec77c6a6c1d1738b1c20106f7d53ef39c9cf64c1853'
            'SKIP')
validpgpkeys=(
              '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # Alexandre Oliva
)

package() {
  cd "${srcdir}/${_srcname}"

  install -d -m755 "$pkgdir"/usr/lib/firmware
  make INSTALL_FW_PATH="$pkgdir"/usr/lib/firmware firmware_install

  install -Dm644 firmware/WHENCE $pkgdir/usr/share/licenses/$pkgname
}
