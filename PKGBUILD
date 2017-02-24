# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck[at]w4it[dot]eu>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>

pkgbase=phpstorm
pkgname=(phpstorm phpstorm-jre)
pkgver=2016.3.2
_pkgver=163.10504.2
pkgrel=2
pkgdesc='Lightweight and Smart PHP IDE'
arch=('x86_64' 'i686')
license=('Commercial')
url='https://www.jetbrains.com/phpstorm/'
options=('!strip')
makedepends=('rsync')
source=(https://download.jetbrains.com/webide/PhpStorm-${pkgver}.tar.gz
        jetbrains-phpstorm.desktop)
sha512sums=('4fe6c53b3f10b74e45e639543b139fbb284f2e5a30d6c4503e73cc097acd833b79a5736eb9d6fd50368fa5c9d54c1f3b79752c56362167f9a7de813e71912c46'
            'fe312d7c637ec20bd946f2e22681243a51f29afc1052ae3fe5afd0fe01f77c222bf1e2c98f0afad8d5385466215653b7ffa8718da05b6dac100ba768ff2be1d6')

package_phpstorm() {
  optdepends=('phpstorm-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime>=8: JRE - Required if phpstorm-jre is not installed')

  install -d -m 755 ${pkgdir}/opt/
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/applications/
  install -d -m 755 ${pkgdir}/usr/share/pixmaps/

  rsync -rtl ${srcdir}/PhpStorm-${_pkgver}/ ${pkgdir}/opt/${pkgbase} --exclude=/jre

  ln -s /opt/${pkgbase}/bin/${pkgbase}.sh ${pkgdir}/usr/bin/${pkgbase}
  install -D -m 644 ${srcdir}/jetbrains-${pkgbase}.desktop ${pkgdir}/usr/share/applications/
  install -D -m 644 ${pkgdir}/opt/${pkgbase}/bin/${pkgbase}.png ${pkgdir}/usr/share/pixmaps/${pkgbase}.png
}

package_phpstorm-jre() {
  install -d -m 755 ${pkgdir}/opt/${pkgbase}
  rsync -rtl ${srcdir}/PhpStorm-${_pkgver}/jre ${pkgdir}/opt/${pkgbase}
}
