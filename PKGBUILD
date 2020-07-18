# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mass-up
pkgver=1.0.14
pkgrel=1
pkgdesc="An open-source mass spectrometry software for proteomics designed to support the preprocessing and Machine-Learning based analysis of MALDI-TOF mass spectrometry data"
arch=('x86_64')
url='http://www.sing-group.org/mass-up'
license=('GPL3')
depends=('readline6'
         'r-rjava'
         'java-environment'
         'libxtst'
         'libxslt'
         'alsa-lib'
         'gtk2'
         'libglvnd'
         'libnet')
source=("${pkgname}-${pkgver}.tar.gz::http://static.sing-group.org/MassUp/installers/Mass-Up-${pkgver}.linux.x64.tar.gz")
sha256sums=('84d9512c42c2d67231702d96c1605ae51dc6a52c09bf3123fc302048061fc55e')

package() {
  install -d "${pkgdir}/opt"
  cp -avR Mass-Up-${pkgver}.linux.x64 "${pkgdir}/opt/Mass-Up"
  echo "#!/usr/bin/env bash
  cd /opt/Mass-Up/
  ./run.sh" > mass-up
  install -Dm755 mass-up -t "${pkgdir}/usr/bin"
  install -Dm644 Mass-Up-${pkgver}.linux.x64/Mass-UpSplashScreen.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Mass-Up" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Development;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}