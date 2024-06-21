# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgbase=goland
pkgname=(goland goland-jre)
pkgver=2024.1.4
pkgrel=1
arch=('x86_64' 'i686')
url='https://www.jetbrains.com/go/'
license=('custom:jetbrains')
depends=('glib2')
options=('!strip')
source=("https://download-cf.jetbrains.com/go/${pkgbase}-${pkgver}.tar.gz"
        jetbrains-goland.desktop
        LICENSE)
b2sums=('66031d4e8fdf46a07c59e04a6ee4b3e8f914b44b58292a1b200fa8c3934100fcade2aa8d7aebff983d9adcf5021ca6e3b0e4d6f560038f2ce488e734937d5a91'
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
