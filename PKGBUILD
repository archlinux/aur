# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=dataspell
pkgname=(dataspell dataspell-jre)
pkgver=213.1558.18
pkgrel=1
pkgdesc='Python IDE for data scientists'
arch=('x86_64' 'i686')
license=('custom:jetbrains')
url='https://www.jetbrains.com/dataspell/'
depends=('glib2' 'python')
options=('!strip')
source=("https://download.jetbrains.com/python/jetbrains-data-spell-${pkgver}.tar.gz"
        jetbrains-dataspell.desktop
        LICENSE)
b2sums=('91727a9a3eb853b762289a2440b85ae7ee10415e9ac4eededba89a694127375e1270ac2f226ff82a12f8f2ae23b892752643aa01a2cfd797df75facdd5dad4f0'
        '6bd52dffc824f7ece9255b36321915e9d488ee910969f317e0e8c1e1aa7d58e4c2cb2588941670d84c4226c8133f7435f3fdc8d65fd8b2cab84a0022b1c7f5e9'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

package_dataspell() {
  optdepends=('dataspell-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if dataspell-jre is not installed'
              'gnome-keyring: save login/deployment credentials safely'
              'java-openjfx: rendering Markdown files')

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/jetbrains-ds-${pkgver}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  ln -s /opt/${pkgbase}/bin/${pkgbase}.sh "${pkgdir}"/usr/bin/${pkgbase}
  install -D -m 644 "${srcdir}"/jetbrains-${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -D -m 644 "${pkgdir}"/opt/${pkgbase}/bin/${pkgbase}.svg "${pkgdir}"/usr/share/pixmaps/${pkgbase}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_dataspell-jre() {
  pkgdesc='JBR (JetBrains Runtime) for DataSpell - a patched JRE'
  url='https://confluence.jetbrains.com/display/JBR/JetBrains+Runtime'

  install -d -m 755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/jetbrains-ds-${pkgver}/jbr "${pkgdir}"/opt/${pkgbase}
}
