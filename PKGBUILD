# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck[at]w4it[dot]eu>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>

pkgname=phpstorm
_pkgname=PhpStorm
_pkgbuild=143.381.48
pkgver=10.0
pkgrel=1
pkgdesc="Lightweight and Smart PHP IDE"
arch=('x86_64' 'i686')
options=(!strip)
url="http://www.jetbrains.com/phpstorm/"
license=('custom')
depends=('bash' 'java-environment>=6')
install='phpstorm.install'
source=("https://download.jetbrains.com/webide/PhpStorm-${pkgver}.tar.gz"
        "phpstorm.desktop"
        "phpstorm.install")
sha256sums=('eaf54dde5290a19f46821c61cf983e732e8ab0a88c3ddaae21ed836e4bc6125c'
            '406b491d489228f7e4ba32ef160684bbef5056dacb233ac5d2ca9bca3013c939'
            'cc9c4da00fab7511a882e14728f3ce20b50c10a25ec6aeebd5d1b9a515d7ae6b')

package() {
  install -d -m 755 ${pkgdir}/opt/
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/applications/
  install -d -m 755 ${pkgdir}/usr/share/pixmaps/

  cp -a ${srcdir}/${_pkgname}-${_pkgbuild} $pkgdir/opt/${pkgname}

  if [[ $CARCH = 'i686' ]]; then
     rm -f ${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so
     rm -f ${pkgdir}/opt/${pkgname}/bin/fsnotifier64
  fi
  if [[ $CARCH = 'x86_64' ]]; then
     rm -f ${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux.so
     rm -f ${pkgdir}/opt/${pkgname}/bin/fsnotifier
  fi

  ln -s /opt/$pkgname/bin/phpstorm.sh $pkgdir/usr/bin/phpstorm
  install -D -m 644 ${srcdir}/phpstorm.desktop ${pkgdir}/usr/share/applications/
  install -D -m 644 "${pkgdir}/opt/${pkgname}/bin/webide.png" "${pkgdir}/usr/share/pixmaps/phpstorm.png"
}
