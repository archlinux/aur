# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Márcio Silva <coadde@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>

pkgname=linux-libre-firmware
_pkgver=4.5-gnu

_srcname=linux-${_pkgver%-*}
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='Firmware files for Linux-libre'
arch=('any')
url='http://linux-libre.fsfla.org/'
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
replaces=('linux-firmware'
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
source=("http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/linux-libre-${_pkgver}.tar.xz"
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/linux-libre-${_pkgver}.tar.xz.sign")
sha256sums=('c37a135518d5a69b26bae8441bc20e5a5ea87d3228cfe72f75a714cff730a84e'
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
