# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgbase=rustrover-eap
pkgname=("${pkgbase}" "${pkgbase}-jre")
pkgver=241.15989.180
pkgrel=1
pkgdesc="JetBrains IDE for Rust Developers (EAP)"
arch=('x86_64' 'aarch64')
options=('!strip')
url="https://www.jetbrains.com/rust/"
license=('custom:jetbrains')
source=("jetbrains-${pkgbase}.desktop" 'LICENSE')
source_x86_64=("jetbrains-${pkgbase}-${pkgver}-${arch[0]}.tar.gz::https://download-cdn.jetbrains.com/rustrover/RustRover-${pkgver}.tar.gz")
source_aarch64=("jetbrains-${pkgbase}-${pkgver}-${arch[1]}.tar.gz::https://download-cdn.jetbrains.com/rustrover/RustRover-${pkgver}-${arch[1]}.tar.gz")
sha256sums=('5f20e23e39d7fa8ef47945fad845c9918ec77c9d6b94f8f31b7286c1a656eb7f'
            'db26ca1fd026fbacfeb87f4bad42d78b3512bb733ce1c566bdd5b751e77d7bb3')
sha256sums_x86_64=('73bec7f1406c953ac154ae7652701681a60fadfa673235b18bbfb9d545f8353f')
sha256sums_aarch64=('8d4a9cc01465d2c54267b967a928cd814720f08b826a40d9be895cfcfa57c423')

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

  install -Dm 644 "jetbrains-${pkgbase}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgbase}"

  install -dm 755 "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgbase}/bin/rustrover.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
  ln -s "/opt/${pkgbase}/bin/rustrover.svg" "${pkgdir}/usr/share/pixmaps/${pkgbase}.svg"
}


package_rustrover-eap-jre() {
  license=('GPL2')
  pkgdesc='JBR (JetBrains Runtime) for RustRover EAP - a patched JRE'
  url='https://github.com/JetBrains/JetBrainsRuntime'

  install -dm 755 "${pkgdir}/opt/${pkgbase}"
  cp -a "RustRover-${pkgver}/jbr" "${pkgdir}"/opt/${pkgbase}
}
