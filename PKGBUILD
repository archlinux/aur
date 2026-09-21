# Maintainer: Steven Seifried <gitlab@canox.net>

pkgname=tuxedo-control-center-bin
pkgver=3.0.10
pkgrel=2
pkgdesc="A tool to help you control performance, energy, fan and comfort settings on TUXEDO laptops. "
arch=(x86_64)
url="https://github.com/tuxedocomputers/tuxedo-control-center"
license=('GPL3')
depends=('tuxedo-drivers-dkms' 'libxss' 'nss' 'gtk3' 'upower')
optdepends=('libayatana-appindicator' 'libappindicator-gtk3')
conflicts=('tuxedo-control-center' 'auto-cpufreq')
options=(!strip !debug)
install=${pkgname}.install

source=(https://rpm.tuxedocomputers.com/fedora/43/x86_64/base/tuxedo-control-center_${pkgver}.rpm tuxedo-control-center-bin.install)
sha256sums=('05c4f559463f02d0840791c5375792a71a1a5a1519110bb2d357499754a045ca'
            'fef8f708ff4ba19921f167ff9bffd2536cc0c128dfe418a30f7e5e0d04fca6e3')
sha512sums=('9e1e5d5b7e015d2eecc2c068ef367497ddb1fb755a5b4948b1db263fb7d64198b3df1977bf744cfef5ab48e53cad4c0caf4d1aa26e5271de68837a6ab1a77d4a'
            'b70d3412f07c72d6de2cf18e75a184741d8f5db7f144c4d8e8c0dde752e197d831fc8f8b6c095c9b6387ff97b36567f9cf5167dbb23ebc392f7b3cc47a78111a')

package() {
  cp -a usr "${pkgdir}"
  cp -a opt "${pkgdir}"
  chmod -R 755 "${pkgdir}"/opt/tuxedo-control-center/
  mkdir -p "${pkgdir}/usr/bin"
  ln -sfv /opt/tuxedo-control-center/tuxedo-control-center "${pkgdir}/usr/bin/tuxedo-control-center"
  install -Dm644 "${srcdir}/opt/tuxedo-control-center/resources/dist/tuxedo-control-center/data/dist-data/tuxedo-control-center.desktop" "${pkgdir}/usr/share/applications/tuxedo-control-center.desktop"
  install -Dm644 "${srcdir}/opt/tuxedo-control-center/resources/dist/tuxedo-control-center/data/dist-data/com.tuxedocomputers.tccd.policy" "${pkgdir}/usr/share/polkit-1/actions/com.tuxedocomputers.tccd.policy"
  install -Dm644 "${srcdir}/opt/tuxedo-control-center/resources/dist/tuxedo-control-center/data/dist-data/com.tuxedocomputers.tccd.conf" "${pkgdir}/usr/share/dbus-1/system.d/com.tuxedocomputers.tccd.conf"
  install -Dm644 "${srcdir}/opt/tuxedo-control-center/resources/dist/tuxedo-control-center/data/dist-data/tccd.service" "${pkgdir}/usr/lib/systemd/system/tccd.service"
  install -Dm644 "${srcdir}/opt/tuxedo-control-center/resources/dist/tuxedo-control-center/data/dist-data/tccd-sleep.service" "${pkgdir}/usr/lib/systemd/system/tccd-sleep.service"
}

