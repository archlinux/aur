# Maintainer: LJ <aur.lj at munally.com>

pkgname=universal-analog-plugin-bin
_pkgname=universal-analog-plugin
pkgver=0.3.3
pkgrel=1
pkgdesc="A plugin for the Wooting Analog SDK that makes it support a wider range of keyboards."
arch=('x86_64')
url="https://github.com/AnalogSense/$_pkgname"
license=('MIT')
source=(
  "https://github.com/AnalogSense/$_pkgname/releases/download/$pkgver/Linux.zip"
  "https://analogsense.org/udev-rules/70-analogsense.rules"
)
b2sums=('6851fd240ad86733560efca4d18f4141d08f4de7976ec9dbee563ca9923ad48e52c57f6646aaf004513eabd3e98cfb8fead97de5f55e53b18f0eef2ce9b45d2a'
        '784d6a51a18218cbce521c48e9d9bd8e6248e70c1b59896b44a126cb062573dce31dfc7ec4b3ff2ec67f5d863104c49cb0044366499f59b6bae25b2db3dc7684')

package() {
  cd "${pkgdir}"
  unzip "${srcdir}/Linux.zip"
  mkdir -p "${pkgdir}/usr/local/share/WootingAnalogPlugins/"
  mv "universal-analog-plugin/"* "$pkgdir/usr/local/share/WootingAnalogPlugins/"
  install -Dm644 "${srcdir}/70-analogsense.rules" "$pkgdir/etc/udev/rules.d/70-analogsense.rules"
  echo "Please run 'sudo udevadm control --reload-rules && sudo udevadm trigger' for the changes to tage effect immediately"
}
