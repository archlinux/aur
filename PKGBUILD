# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=rustrover
pkgname=(rustrover rustrover-jre)
pkgver=2025.3
pkgrel=1
pkgdesc='JetBrains IDE for Rust Developers'
arch=('x86_64')
url='https://www.jetbrains.com/rust/'
license=('custom:jetbrains')
depends=('glib2')
options=('!strip')
source=("https://download.jetbrains.com/${pkgbase}/RustRover-${pkgver}.tar.gz"
        jetbrains-rustrover.desktop
        LICENSE)
b2sums=('cf66ae8d5bad43c89471d93b72157971f23e5562616e657a29f46ea9356baabbc8021527f3a8603878379d553df4ec33105465246455751295f6d65e47440525'
        '90abe1f33f60937648959e3a46c3d975ceeb09d0e7b2af535d310557c73ae865d8de29481d854e7503b913448ca54924a0fe07040e93216f0f368f2da827e70c'
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

  ln -s /opt/${pkgbase}/bin/${pkgbase} "${pkgdir}"/usr/bin/${pkgbase}
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
