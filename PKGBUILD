# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgbase=rustrover-eap
pkgname=("${pkgbase}" "${pkgbase}-jre")
pkgver=232.9921.62
pkgrel=4
pkgdesc="Rust IDE by JetBrains"
arch=('x86_64' 'aarch64')
options=('!strip')
url="https://www.jetbrains.com/rust/"
license=('custom:jetbrains')
source=("${pkgbase}.desktop" 'jetbrains-eap-3.3.docx')
source_x86_64=("${pkgbase}-${pkgver}-${arch[0]}.tar.gz::https://download-cdn.jetbrains.com/rustrover/RustRover-${pkgver}.tar.gz")
source_aarch64=("${pkgbase}-${pkgver}-${arch[1]}.tar.gz::https://download-cdn.jetbrains.com/rustrover/RustRover-${pkgver}-${arch[1]}.tar.gz")
sha256sums=('87a122544f85c7334a23e0b5051b09d03d975f93f151e735cd65bdeef5093bc1'
            'c05432334b1df86156e2fb0021b27ab8615bb31be26d60f96bf804333bef5685')
sha256sums_x86_64=('1f67e1a82f5cbb7c84382c7f251ae06b1e2699fa7d2fa4129e23ec2e43251687')
sha256sums_aarch64=('fca556502e9a532ee4ad7a3c0a470377f9f4ecb7d9b7d8311467a107b29fc868')

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
  install -Dm 644 "jetbrains-eap-3.3.docx" -t "${pkgdir}/usr/share/licenses/${pkgbase}"

  install -dm 755 "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgbase}/bin/rustrover.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
  ln -s "/opt/${pkgbase}/bin/rustrover.svg" "${pkgdir}/usr/share/pixmaps/${pkgbase}.svg"
}


package_rustrover-eap-jre() {
  license=('GPL2')
  pkgdesc='JBR (JetBrains Runtime) for RustRover - a patched JRE'
  url='https://github.com/JetBrains/JetBrainsRuntime'

  install -dm 755 "${pkgdir}/opt/${pkgbase}"
  cp -a "RustRover-${pkgver}/jbr" "${pkgdir}"/opt/${pkgbase}
}
