# Based on the file created by the Manjaro Team:
# Maintainer: Philip Müller <philm[AT]manjaro[DOT]org>
# Contributor: Helmut Stult <helmut[AT]manjaro[DOT]org>

# Maintainer: Steven Seifried <gitlab@canox.net>

pkgname=tuxedo-control-center-bin
pkgver=1.2.0
pkgrel=2
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
sha256sums=('06e405569f30c58d53e37fa13edda81230c379c0f133a479153b6c3c323e767c'
            'fef8f708ff4ba19921f167ff9bffd2536cc0c128dfe418a30f7e5e0d04fca6e3')
sha512sums=('1a0e1f03ce813ebc0769b588eded4a21fabc36f78fadc86b0db86f2d7882a75147e73939a011a4973912a37f967ef9bef1b2233ac106c1a4a2db30a0ba2ce575'
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

