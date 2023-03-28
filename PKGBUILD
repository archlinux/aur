# Based on the file created by the Manjaro Team:
# Maintainer: Philip Müller <philm[AT]manjaro[DOT]org>
# Contributor: Helmut Stult <helmut[AT]manjaro[DOT]org>

# Maintainer: Steven Seifried <gitlab@canox.net>

pkgname=tuxedo-control-center-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="A tool to help you control performance, energy, fan and comfort settings on TUXEDO laptops. "
arch=(x86_64)
url="https://github.com/tuxedocomputers/tuxedo-control-center"
license=('GPL3')
depends=('tuxedo-keyboard-dkms' 'libxss' 'nss' 'gtk3')
optdepends=('libayatana-appindicator' 'libappindicator-gtk3' 'nvidia-prime')
conflicts=('tuxedo-control-center' 'auto-cpufreq')
replaces=('tuxedo-control-center')
options=(!strip)
install=${pkgname}.install

source=(https://rpm.tuxedocomputers.com/opensuse/15.4/x86_64/tuxedo-control-center_${pkgver}.rpm tuxedo-control-center-bin.install)
sha256sums=('2741210ea58b0e37c5e79660a25b884978aba0ff4128cfb152d6243635cb0c8e'
            'fef8f708ff4ba19921f167ff9bffd2536cc0c128dfe418a30f7e5e0d04fca6e3')
sha512sums=('e9c9abfc2c0d0e226038f49d388a31625120f6780558b7606e719be61a4563c698e4c46d6f0d6a3e774179a5f5785dc07ff243901578da474dfa80cf71fe0394'
            'b70d3412f07c72d6de2cf18e75a184741d8f5db7f144c4d8e8c0dde752e197d831fc8f8b6c095c9b6387ff97b36567f9cf5167dbb23ebc392f7b3cc47a78111a')

package() {
  cp -av usr "${pkgdir}"
  cp -av opt "${pkgdir}"
  chmod -R 755 "${pkgdir}"/opt/tuxedo-control-center/
  mkdir -p "${pkgdir}/usr/bin"
  ln -sfv /opt/tuxedo-control-center/tuxedo-control-center "${pkgdir}/usr/bin/tuxedo-control-center"
  install -Dm644 "${srcdir}/opt/tuxedo-control-center/resources/dist/tuxedo-control-center/data/dist-data/tuxedo-control-center.desktop" "${pkgdir}/usr/share/applications/tuxedo-control-center.desktop"
  install -Dm644 "${srcdir}/opt/tuxedo-control-center/resources/dist/tuxedo-control-center/data/dist-data/com.tuxedocomputers.tccd.policy" "${pkgdir}/usr/share/polkit-1/actions/com.tuxedocomputers.tccd.policy"
  install -Dm644 "${srcdir}/opt/tuxedo-control-center/resources/dist/tuxedo-control-center/data/dist-data/com.tuxedocomputers.tccd.conf" "${pkgdir}/usr/share/dbus-1/system.d/com.tuxedocomputers.tccd.conf"
  install -Dm644 "${srcdir}/opt/tuxedo-control-center/resources/dist/tuxedo-control-center/data/dist-data/tccd.service" "${pkgdir}/etc/systemd/system/tccd.service"
  install -Dm644 "${srcdir}/opt/tuxedo-control-center/resources/dist/tuxedo-control-center/data/dist-data/tccd-sleep.service" "${pkgdir}/etc/systemd/system/tccd-sleep.service"
}

