# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck[at]w4it[dot]eu>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>

pkgname=phpstorm
_pkgname=PhpStorm
pkgver=2016.1
_pkgver=145.258.2
pkgrel=2
pkgdesc="Lightweight and Smart PHP IDE"
arch=('x86_64' 'i686')
options=('!strip')
url="http://www.jetbrains.com/${pkgname}/"
license=('Commercial')
optdepends=('java-environment>=6: use system java'
            'java-runtime-common: use system java')
source=(https://download.jetbrains.com/webide/${_pkgname}-${pkgver}.tar.gz
        jetbrains-phpstorm.desktop
        phpstorm.sh)
sha256sums=('48b3b1d4e4dec954bb224193aea367b6aa6893d286c0e022775e9f81527251ce'
            '406b491d489228f7e4ba32ef160684bbef5056dacb233ac5d2ca9bca3013c939'
            '803093f27b726fbd9feba542b9c5e481b95624e0d96c11b3025a12bc600ed545')

package() {
  install -d -m 755 ${pkgdir}/opt/
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/applications/
  install -d -m 755 ${pkgdir}/usr/share/pixmaps/
  install -d -m 755 ${pkgdir}/etc/profile.d/

  cp -a ${srcdir}/${_pkgname}-${_pkgver} $pkgdir/opt/${pkgname}
  # to force system java, have a look at /etc/profile.d/${pkgname}.sh
  # if using system java you may remove the bundled jre and save about 100M
  #rm -rf $pkgdir/opt/${pkgname}/jre

  ln -s /opt/$pkgname/bin/${pkgname}.sh $pkgdir/usr/bin/${pkgname}
  install -D -m 644 ${srcdir}/jetbrains-${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -D -m 644 ${srcdir}/phpstorm.sh ${pkgdir}/etc/profile.d/
  install -D -m 644 "${pkgdir}/opt/${pkgname}/bin/webide.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
