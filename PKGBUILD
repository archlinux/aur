# Maintainer: Steven Seifried <gitlab@canox.net>

pkgname=tuxedo-control-center-bin
pkgver=3.0.4
pkgrel=1
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
sha256sums=('8916897289e47d60a62bcf1d0619a5c26f3cc232e376d1a8f497e0562eafe0de'
            'fef8f708ff4ba19921f167ff9bffd2536cc0c128dfe418a30f7e5e0d04fca6e3')
sha512sums=('b69e89046895d6d81c865ab0de2d22590dcafac0896c56491739aa5b1f0b447a80e0197397ff83ff3ef1c475732ece4221da12c270d827bacbeaed5b3018bf73'
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

