# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgbase=rustrover-eap
pkgname=("${pkgbase}" "${pkgbase}-jre")
pkgver=233.8264.22
pkgrel=2
pkgdesc="Rust IDE by JetBrains (EAP)"
arch=('x86_64' 'aarch64')
options=('!strip')
url="https://www.jetbrains.com/rust/"
license=('custom:jetbrains')
source=("${pkgbase}.desktop" 'LICENSE')
source_x86_64=("${pkgbase}-${pkgver}-${arch[0]}.tar.gz::https://download-cdn.jetbrains.com/rustrover/RustRover-${pkgver}.tar.gz")
source_aarch64=("${pkgbase}-${pkgver}-${arch[1]}.tar.gz::https://download-cdn.jetbrains.com/rustrover/RustRover-${pkgver}-${arch[1]}.tar.gz")
sha256sums=('87a122544f85c7334a23e0b5051b09d03d975f93f151e735cd65bdeef5093bc1'
            'db26ca1fd026fbacfeb87f4bad42d78b3512bb733ce1c566bdd5b751e77d7bb3')
sha256sums_x86_64=('3dd8e99b066164efc11e86e3289e444c5238dfce8e9142fe2d3a8c340eeeb175')
sha256sums_aarch64=('812c33f46f8c7e309e777f10b6806b3658d7f90f95aa1a776c686aafabb290e7')

package_rustrover-eap() {
  depends=('glib2')
  optdepends=('rust-src: Rust toolchain'
              "${pkgbase}-jre: JetBrains custom Java Runtime (Recommended)"
              "java-runtime=17: JRE - Required if ${pkgbase}-jre is not installed")

  install -dm 755 "${pkgdir}/opt/${pkgbase}"
  cp -a "RustRover-${pkgver}/." "${pkgdir}/opt/${pkgbase}"
  rm -rf "${pkgdir}/opt/${pkgbase}/jbr"

  install -dm 755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgbase}/bin/rustrover.sh" "${pkgdir}/usr/bin/${pkgbase}"

  install -Dm 644 "${pkgbase}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgbase}"

  install -dm 755 "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgbase}/bin/rustrover.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
  ln -s "/opt/${pkgbase}/bin/rustrover.svg" "${pkgdir}/usr/share/pixmaps/${pkgbase}.svg"
}


package_rustrover-eap-jre() {
  license=('GPL2')
  pkgdesc='JBR (JetBrains Runtime) for RustRover EAP- a patched JRE'
  url='https://github.com/JetBrains/JetBrainsRuntime'

  install -dm 755 "${pkgdir}/opt/${pkgbase}"
  cp -a "RustRover-${pkgver}/jbr" "${pkgdir}"/opt/${pkgbase}
}
