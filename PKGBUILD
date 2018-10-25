# Maintainer: Mitchell Hentges <mitch9654[at]gmail[dot]com>
# Past Maintainer: Sebastian Krebs <sebastian[at]krebs[dot]one>
# Contributor: Yakir Sitbon <kingyes1[at]gmail[dot]com>
# Contributor: Eduard Kracmar <edke.kraken[at]gmail[dot]com>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>
# Contributor: Patrik Votoček <patrik[at]votocek[dot]cz>

pkgbase=phpstorm-eap
pkgname=(phpstorm-eap phpstorm-eap-jre)
pkgver=183.3795.24
_dlver=183.3795.24
pkgrel=1
pkgdesc="Lightning-smart PHP IDE. Early Access Program."
arch=('x86_64' 'i686')
license=('Commercial')
url='https://www.jetbrains.com/phpstorm/'
depends=('libdbusmenu-glib')
makedepends=('rsync')
options=('!strip')
source=(https://download.jetbrains.com/webide/PhpStorm-${_dlver}.tar.gz
        jetbrains-phpstorm-eap.desktop)
sha256sums=('4557e084203d1d362ba1f7b1fbfd98683d8d3d6e6dcd44d640c91b858542c24f'
            '4d74831366821e39b13e71da3cc3bb09ae0011e1c33f0917d4c1b99852fd7928')

package_phpstorm-eap() {
  optdepends=('phpstorm-eap-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if phpstorm-eap-jre is not installed'
              'gnome-keyring: save login/deployment credentials safely')

  install -d -m 755 "${pkgdir}/opt/"
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/share/applications/"
  install -d -m 755 "${pkgdir}/usr/share/pixmaps/"

  rsync -rtl "${srcdir}/PhpStorm-${pkgver}/" "${pkgdir}/opt/${pkgbase}" --exclude=/jre64

  ln -s "/opt/${pkgbase}/bin/phpstorm.sh" "${pkgdir}/usr/bin/${pkgbase}"
  install -D -m 644 "${srcdir}/jetbrains-${pkgbase}.desktop" "${pkgdir}/usr/share/applications/"
  install -D -m 644 "${pkgdir}/opt/${pkgbase}/bin/phpstorm.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
}

package_phpstorm-eap-jre() {
  install -d -m 755 "${pkgdir}/opt/${pkgbase}"
  rsync -rtl "${srcdir}/PhpStorm-${pkgver}/jre64" "${pkgdir}/opt/${pkgbase}"
}
