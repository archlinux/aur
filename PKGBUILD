# Maintainer: Arsenii Liubogashchinskii <tarsenicum at gmail dot com>

pkgbase=rustrover-rustless
pkgname=(rustrover rustrover-jre)
pkgver=232.9921.46
pkgrel=1
pkgdesc='JetBrains IDE for Rust Developers without rust dependecies'
arch=('any')
url='https://www.jetbrains.com/rust/'
license=('custom:jetbrains')
depends=('glib2')
options=('!strip')
source=("https://download.jetbrains.com/${pkgbase}/RustRover-${pkgver}.tar.gz"
        jetbrains-rustrover.desktop
        LICENSE)
b2sums=('51c520e5f08d179ebf394ca7dee964c51e277e2a048b080879cb73d7f2e549a951fbe70d14cab2bce75d0ab6acb55010eca9772b962164e7c64f9a3b407ce020'
        '2ff312ed00796449ba37ff2b449c1cea8ed9edcb7d5e1cbce8a36c41184e04a38f1b8c56c913c26834d09e5f990063aed6a55f9b5ccbf79bda86f5b2552e60c5'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

package_rustrover() {
  optdepends=('rustrover-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if rustrover-jre is not installed')

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/RustRover-${pkgver}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  ln -s /opt/${pkgbase}/bin/${pkgbase}.sh "${pkgdir}"/usr/bin/${pkgbase}
  install -m644 "${srcdir}"/jetbrains-${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -m644 "${pkgdir}"/opt/${pkgbase}/bin/${pkgbase}.svg "${pkgdir}"/usr/share/pixmaps/${pkgbase}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_rustrover-jre() {
  pkgdesc='JBR (JetBrains Runtime) for RustRover - a patched JRE'
  url='https://confluence.jetbrains.com/display/JBR/JetBrains+Runtime'

  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/RustRover-${pkgver}/jbr "${pkgdir}"/opt/${pkgbase}
}
