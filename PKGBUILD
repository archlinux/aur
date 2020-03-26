# Maintainer: Fikri Muhammad Iqbal <fikri.miqbal23[at]gmail[dot]com>
# Past Maintainer: Mitchell Hentges <mitch9654[at]gmail[dot]com>
# Past Maintainer: Sebastian Krebs <sebastian[at]krebs[dot]one>
# Contributor: Yakir Sitbon <kingyes1[at]gmail[dot]com>
# Contributor: Eduard Kracmar <edke.kraken[at]gmail[dot]com>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>
# Contributor: Patrik Votoček <patrik[at]votocek[dot]cz>

pkgbase=phpstorm-eap
pkgname=(phpstorm-eap phpstorm-eap-jre)
pkgver=201.6668.30
dl_pkgver=201.6668.30
pkgrel=1
pkgdesc="Lightning-smart PHP IDE. Early Access Program."
arch=('x86_64' 'i686')
license=('Commercial')
url='https://www.jetbrains.com/phpstorm/'
depends=('libdbusmenu-glib')
makedepends=('rsync')
options=('!strip')
source=(https://download.jetbrains.com/webide/PhpStorm-${dl_pkgver}.tar.gz
        jetbrains-phpstorm-eap.desktop)
sha256sums=('364b1b729c65bd10ca56875525ce615d7d39c52a93e1b2375a19b0a8a20a7bdb'
            'b08cebee65c3d8949f91a18ceff45e6713fa59af8434fa56fdac067f2f6a00f7')

package_phpstorm-eap() {
  optdepends=('phpstorm-eap-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if phpstorm-eap-jre is not installed'
              'gnome-keyring: save login/deployment credentials safely')

  install -d -m 755 "${pkgdir}/opt/"
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/share/applications/"
  install -d -m 755 "${pkgdir}/usr/share/pixmaps/"

  rsync -rtl "${srcdir}/PhpStorm-${pkgver}/" "${pkgdir}/opt/${pkgbase}" --exclude=/jbr

  ln -s "/opt/${pkgbase}/bin/phpstorm.sh" "${pkgdir}/usr/bin/${pkgbase}"
  install -D -m 644 "${srcdir}/jetbrains-${pkgbase}.desktop" "${pkgdir}/usr/share/applications/"
  install -D -m 644 "${pkgdir}/opt/${pkgbase}/bin/phpstorm.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
}

package_phpstorm-eap-jre() {
  install -d -m 755 "${pkgdir}/opt/${pkgbase}"
  rsync -rtl "${srcdir}/PhpStorm-${pkgver}/jbr" "${pkgdir}/opt/${pkgbase}"
}
