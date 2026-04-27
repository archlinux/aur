# Maintainer: LJ <aur.lj at munally.com>

pkgname=universal-analog-plugin-bin
_pkgname=universal-analog-plugin
pkgver=0.3.5
pkgrel=2
pkgdesc="A plugin for the Wooting Analog SDK that makes it support a wider range of keyboards."
arch=('x86_64')
url="https://github.com/AnalogSense/$_pkgname"
license=('MIT')
source=(
  "https://github.com/AnalogSense/$_pkgname/releases/download/$pkgver/Linux.Ubuntu.22.04+.zip"
  "https://analogsense.org/udev-rules/70-analogsense.rules"
)
sha256sums=(
  "87faf1e65247a76a16b35dafdf2d52ed2c3c36732037935a7e2dcc2be8726af1"
  "a4cfdd8e82e13b26199c71c40494c3efd4c7d63b6f4400852bf95b00e6621a07"
)

package() {
  cd "${pkgdir}"
  unzip "${srcdir}/Linux.zip"
  mkdir -p "${pkgdir}/usr/local/share/WootingAnalogPlugins/"
  mv "universal-analog-plugin/"* "$pkgdir/usr/local/share/WootingAnalogPlugins/"
  install -Dm644 "${srcdir}/70-analogsense.rules" "$pkgdir/etc/udev/rules.d/70-analogsense.rules"
  echo "Please run 'sudo udevadm control --reload-rules && sudo udevadm trigger' for the changes to take effect immediately"
}
