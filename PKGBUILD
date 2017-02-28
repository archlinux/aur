# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Márcio Silva <coadde@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>

pkgname=linux-libre-firmware
_pkgver=4.10-gnu

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
source=("https://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/linux-libre-${_pkgver}.tar.xz"
        "https://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/linux-libre-${_pkgver}.tar.xz.sign")
sha512sums=('44d1774a1d43a15322297d351737fbcbf92c6f433266ce2b17587437d433562cf5811fdae48fafd5a8e00d18ed9ac2e1ad4b12a657f322eb234384316ad131e0'
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
