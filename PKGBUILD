# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=rustrover
pkgname=(rustrover rustrover-jre)
pkgver=2024.1.4
pkgrel=1
pkgdesc='JetBrains IDE for Rust Developers'
arch=('any')
url='https://www.jetbrains.com/rust/'
license=('custom:jetbrains')
depends=('glib2')
options=('!strip')
source=("https://download-cf.jetbrains.com/${pkgbase}/RustRover-${pkgver}.tar.gz"
        jetbrains-rustrover.desktop
        LICENSE)
b2sums=('2d906f4e29118935300c7ab495a6c01e1f9b58b39a89791130a458cc006f2cfc3762ee274cf75a42a9ae4233e687b7d52224ab2fde5169d7665ba3384ffbd741'
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
  url='https://github.com/JetBrains/JetBrainsRuntime'

  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/RustRover-${pkgver}/jbr "${pkgdir}"/opt/${pkgbase}
}
