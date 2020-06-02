# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=hackrf-spectrum-analyzer
pkgver=1.5
pkgrel=1
pkgdesc="Spectrum Analyzer GUI for hackrf_sweep"
arch=('i686' 'x86_64')
url='https://github.com/pavsa/hackrf-spectrum-analyzer'
license=('GPL3')
depends=('java-runtime>=8' 'hackrf')
makedepends=('gendesk')
source=("$pkgname-$pkgver.zip::https://github.com/pavsa/hackrf-spectrum-analyzer/releases/download/${pkgver}/hackrf_spectrum_analyzer.zip")
sha256sums=('f7e6d640631f559e5d9e92ba6fe5270689ee5195a7298654e054231d9485acab')

package() {
  cd "${srcdir}/lib"
  install -Dm644 program.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 hackrf_sweep_spectrum_analyzer.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  echo "#!/bin/sh
  exec /usr/bin/java -jar '/usr/share/java/${pkgname}/hackrf_sweep_spectrum_analyzer.jar' "\$\@"" > hackrf-spectrum-analyzer.sh
  install -Dm755 hackrf-spectrum-analyzer.sh "${pkgdir}/usr/bin/hackrf-spectrum-analyzer"
  install -Dm644 linux-x86-64/libhackrf-sweep.so -t "${pkgdir}/usr/lib"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "HackRF Spectrum Analyzer" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}