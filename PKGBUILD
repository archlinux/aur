# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: Noor Christensen <archlinux_AT_technopragmatics_DOT_org>

pkgname=hackrf-spectrum-analyzer
pkgver=2024.11.10
pkgrel=1
epoch=1
pkgdesc="Spectrum Analyzer GUI for hackrf_sweep"
arch=('i686' 'x86_64')
url='https://github.com/pavsa/hackrf-spectrum-analyzer'
license=('GPL-3.0-or-later')
depends=('java-runtime>=8' 'hackrf>=2024.02.1' 'fftw>=3', 'libusb>=1')
makedepends=('gendesk')
source=("$pkgname-$pkgver.zip::https://github.com/pavsa/hackrf-spectrum-analyzer/releases/download/v${pkgver}/hackrf_spectrum_analyzer.zip")
sha512sums=('8e54d02bf2d7561acc4633160b18a36d750d09b78f19afec235c850526d96e596a782450e5a48816e36df7c0cda3e97a4da6c5704ace362094d744c9ef4f1646')

package() {
  cd "${pkgname}/lib"
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
          --categories 'Utility;HamRadio;Science;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
