# Maintainer: Steven Seifried <gitlab@canox.net>

pkgname=tuxedo-control-center-bin
pkgver=2.1.15
pkgrel=2
pkgdesc="A tool to help you control performance, energy, fan and comfort settings on TUXEDO laptops. "
arch=(x86_64)
url="https://github.com/tuxedocomputers/tuxedo-control-center"
license=('GPL3')
depends=('tuxedo-drivers-dkms' 'libxss' 'nss' 'gtk3')
optdepends=('libayatana-appindicator' 'libappindicator-gtk3')
conflicts=('tuxedo-control-center' 'auto-cpufreq')
options=(!strip !debug)
install=${pkgname}.install

source=(https://rpm.tuxedocomputers.com/fedora/41/x86_64/base/tuxedo-control-center_${pkgver}.rpm tuxedo-control-center-bin.install)
sha256sums=('41c7e576d92f11b4430627f3d0fad05d842f91a489fd1dd710d680db4f27fa3a'
            'c5d1ab14e21c48fe9138e811c28a207bbf182c1a0f15046d005ce5a7d255a719')
sha512sums=('ca8eed81f3477cf768b760d02728ded42d06f555e087806adff6ac060a7090aeaf531448c758fe2283c3057cd066780d8806af62a9bafae0d302d3b02e952b69'
            '3c7778320186aa1024bbf3709339d9e6216b79449f922461a3e3ea2ae1968436b2fe13a45f39fe4002ad7602f66eec740455e785a5caadb53eb1d801041a56eb')

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

