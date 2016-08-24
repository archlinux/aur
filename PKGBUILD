# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck[at]w4it[dot]eu>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>

pkgname=phpstorm
_pkgname=PhpStorm
pkgver=2016.2.1
_pkgver=162.1889.1
pkgrel=1
pkgdesc="Lightweight and Smart PHP IDE"
arch=('x86_64' 'i686')
options=('!strip')
url="http://www.jetbrains.com/${pkgname}/"
license=('Commercial')
optdepends=('java-environment>=8: use system java'
            'java-runtime-common: use system java')
source=(https://download.jetbrains.com/webide/${_pkgname}-${pkgver}.tar.gz
        jetbrains-phpstorm.desktop)
sha512sums=('c21a2456c55407663251913d59621c81e1e0feab87a3a6e703d7824331e65bc08a37b5863a5fc31cb4029cef0ca4834c2ea9c06efdda262428706beace000186'
            'b258ff195aa7d49e2e8e7b3eda4fc5d69f09e287411d912d8961b787d69b5d0f327589fc2cdce442edbaee7c685eadf2bf6d54d3ae5c720ba02bd1b5cdba3e74')

package() {
  install -d -m 755 ${pkgdir}/opt/
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/applications/
  install -d -m 755 ${pkgdir}/usr/share/pixmaps/

  cp -a ${srcdir}/${_pkgname}-${_pkgver} $pkgdir/opt/${pkgname}
  # if using system java you may remove the bundled jre and save about 100M
  #rm -rf $pkgdir/opt/${pkgname}/jre

  ln -s /opt/$pkgname/bin/${pkgname}.sh $pkgdir/usr/bin/${pkgname}
  install -D -m 644 ${srcdir}/jetbrains-${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -D -m 644 "${pkgdir}/opt/${pkgname}/bin/webide.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
