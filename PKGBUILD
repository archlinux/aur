# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=dataspell-eap
pkgname=(dataspell-eap dataspell-eap-jre)
#rlsver=2022.1
pkgver=222.2270.36
pkgrel=1
pkgdesc='Python IDE for data scientists - EAP'
arch=('x86_64' 'i686')
license=('custom:jetbrains')
url='https://www.jetbrains.com/dataspell/'
depends=('glib2' 'python')
options=('!strip')
source=("https://download.jetbrains.com/python/dataspell-${pkgver}.tar.gz"
        jetbrains-dataspell-eap.desktop
        LICENSE)
b2sums=('5fd1ab8ac10c96f3ed450e93f9674a86d2d438583ab947b71f964bb7c500312a286985a272274ed69b56a3ef42753799fde673678c5e9be91194a4c50f859a1f'
        'd75b40d3bc6778b2bb220cd54089747c8604496073dfb4a7b53ecbaefbdb5ca629e68e3bda15e882076462328b49f4be27c571d83e2c0f6dac653b67dec90775'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

package_dataspell-eap() {
  optdepends=('dataspell-eap-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if dataspell-jre is not installed'
              'gnome-keyring: save login/deployment credentials safely'
              'java-openjfx: rendering Markdown files')

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/dataspell-${rlsver:-${pkgver}}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  ln -s /opt/${pkgbase}/bin/${pkgbase}.sh "${pkgdir}"/usr/bin/${pkgbase}
  install -D -m 644 "${srcdir}"/jetbrains-${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -D -m 644 "${pkgdir}"/opt/${pkgbase}/bin/${pkgbase%-eap}.svg "${pkgdir}"/usr/share/pixmaps/${pkgbase}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_dataspell-eap-jre() {
  pkgdesc='JBR (JetBrains Runtime) for DataSpell - a patched JRE'
  url='https://confluence.jetbrains.com/display/JBR/JetBrains+Runtime'

  install -d -m 755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/dataspell-${rlsver:-${pkgver}}/jbr "${pkgdir}"/opt/${pkgbase}
}
