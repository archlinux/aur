# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck[at]w4it[dot]eu>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>

pkgbase=phpstorm
pkgname=(phpstorm phpstorm-jre)
pkgver=2017.1.1
_pkgver=171.4163.3
pkgrel=1
pkgdesc='Lightweight and Smart PHP IDE'
arch=('x86_64' 'i686')
license=('Commercial')
url='https://www.jetbrains.com/phpstorm/'
options=('!strip')
makedepends=('rsync')
source=(https://download.jetbrains.com/webide/PhpStorm-${pkgver}.tar.gz
        jetbrains-phpstorm.desktop)
sha512sums=('eebaee9e4e250bcd4df70345240801ab1acd0fac5756e0987a9cf750a4239614830ca9c20fc6feafd8a51e9d37fb90429e6622a6418376f8430599c3516f22bd'
            'fe312d7c637ec20bd946f2e22681243a51f29afc1052ae3fe5afd0fe01f77c222bf1e2c98f0afad8d5385466215653b7ffa8718da05b6dac100ba768ff2be1d6')

package_phpstorm() {
  optdepends=('phpstorm-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime>=8: JRE - Required if phpstorm-jre is not installed')

  install -d -m 755 "${pkgdir}/opt/"
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/share/applications/"
  install -d -m 755 "${pkgdir}/usr/share/pixmaps/"

  rsync -rtl "${srcdir}/PhpStorm-${_pkgver}/" "${pkgdir}/opt/${pkgbase}" --exclude=/jre

  ln -s "/opt/${pkgbase}/bin/${pkgbase}.sh" "${pkgdir}/usr/bin/${pkgbase}"
  install -D -m 644 "${srcdir}/jetbrains-${pkgbase}.desktop" "${pkgdir}/usr/share/applications/"
  install -D -m 644 "${pkgdir}/opt/${pkgbase}/bin/${pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
}

package_phpstorm-jre() {
  install -d -m 755 "${pkgdir}/opt/${pkgbase}"
  rsync -rtl "${srcdir}/PhpStorm-${_pkgver}/jre" "${pkgdir}/opt/${pkgbase}"
}
