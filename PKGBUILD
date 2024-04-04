# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=goland
pkgname=(goland goland-jre)
pkgver=2024.1
pkgrel=1
arch=('x86_64' 'i686')
url='https://www.jetbrains.com/go/'
license=('custom:jetbrains')
depends=('glib2')
options=('!strip')
source=("https://download-cf.jetbrains.com/go/${pkgbase}-${pkgver}.tar.gz"
        jetbrains-goland.desktop
        LICENSE)
b2sums=('bde21982c6e8abaffed56405698fb9aa994206ebbf0c51bd0a6488d841e07e9ff658d2437370f592f645e4f841a3cbc8eb8f387167e71867dcf664a2a7711e52'
        '69a09c3ff4182cd5ae43c967b4a58ce3bdf428f0fb87f91f835ffcde5c10019cf4a789cfdb8966ad98c95dda47517a6c49e9c4bf6c217f0cb1b553100730a6a6'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

package_goland() {
  pkgdesc='Capable and Ergonomic Go IDE'
  optdepends=('goland-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if goland-jre is not installed')
  conflicts=('gogland')
  replaces=('gogland')

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/GoLand-${pkgver}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  ln -s /opt/${pkgbase}/bin/${pkgbase}.sh "${pkgdir}"/usr/bin/${pkgbase}
  install -m644 "${srcdir}"/jetbrains-${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -m644 "${pkgdir}"/opt/${pkgbase}/bin/${pkgbase}.svg "${pkgdir}"/usr/share/pixmaps/${pkgbase}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_goland-jre() {
  pkgdesc='JBR (JetBrains Runtime) for Goland - a patched JRE'
  url='https://github.com/JetBrains/JetBrainsRuntime'
  conflicts=('gogland-jre')
  replaces=('gogland-jre')

  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/GoLand-${pkgver}/jbr "${pkgdir}"/opt/${pkgbase}
}
