# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=dataspell
pkgname=(dataspell dataspell-jre)
pkgver=2023.2.2
pkgrel=1
pkgdesc='Python IDE for data scientists'
arch=('x86_64' 'i686')
license=('custom:jetbrains')
url='https://www.jetbrains.com/dataspell/'
depends=('glib2' 'python')
options=('!strip')
source=("https://download.jetbrains.com/python/dataspell-${pkgver}.tar.gz"
        jetbrains-dataspell.desktop
        LICENSE)
b2sums=('ef1ce804585a21effda7daa58c193c83b2e8254f819cbe61d4dee019c131b781dbf754dc358588f21322b5e08ae6847e986e80a7f198f1ba64a1429f59e05a57'
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

  cp -a "${srcdir}"/dataspell-${pkgver}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  chmod +x "${pkgdir}"/opt/dataspell/plugins/r-plugin/rwrapper*linux

  ln -s /opt/${pkgbase}/bin/${pkgbase}.sh "${pkgdir}"/usr/bin/${pkgbase}
  install -D -m 644 "${srcdir}"/jetbrains-${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -D -m 644 "${pkgdir}"/opt/${pkgbase}/bin/${pkgbase}.svg "${pkgdir}"/usr/share/pixmaps/${pkgbase}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_dataspell-jre() {
  pkgdesc='JBR (JetBrains Runtime) for DataSpell - a patched JRE'
  url='https://confluence.jetbrains.com/display/JBR/JetBrains+Runtime'

  install -d -m 755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/dataspell-${pkgver}/jbr "${pkgdir}"/opt/${pkgbase}
}
