# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck[at]w4it[dot]eu>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>

pkgbase=phpstorm
pkgname=(phpstorm phpstorm-jre)
pkgver=2018.1.6
_pkgver=181.5281.35
pkgrel=1
pkgdesc='Lightweight and Smart PHP IDE'
arch=('x86_64' 'i686')
license=('Commercial')
url='https://www.jetbrains.com/phpstorm/'
makedepends=('rsync')
options=('!strip')
source=(https://download.jetbrains.com/webide/PhpStorm-${pkgver}.tar.gz
        jetbrains-phpstorm.desktop)
sha512sums=('89cca9d148cf05a4315a8ede2cfa9389c885cb070f16970f5855609f9fa22c30f3ae2a2c7b29e66bb51e1dda022d4185887a74a05e855ca748507e09c6c42d2e'
            'fe312d7c637ec20bd946f2e22681243a51f29afc1052ae3fe5afd0fe01f77c222bf1e2c98f0afad8d5385466215653b7ffa8718da05b6dac100ba768ff2be1d6')

package_phpstorm() {
  optdepends=('phpstorm-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if phpstorm-jre is not installed'
              'gnome-keyring: save login/deployment credentials safely')

  install -d -m 755 "${pkgdir}/opt/"
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/share/applications/"
  install -d -m 755 "${pkgdir}/usr/share/pixmaps/"

  rsync -rtl "${srcdir}/PhpStorm-${_pkgver}/" "${pkgdir}/opt/${pkgbase}" --exclude=/jre64

  ln -s "/opt/${pkgbase}/bin/${pkgbase}.sh" "${pkgdir}/usr/bin/${pkgbase}"
  install -D -m 644 "${srcdir}/jetbrains-${pkgbase}.desktop" "${pkgdir}/usr/share/applications/"
  install -D -m 644 "${pkgdir}/opt/${pkgbase}/bin/${pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
}

package_phpstorm-jre() {
  install -d -m 755 "${pkgdir}/opt/${pkgbase}"
  rsync -rtl "${srcdir}/PhpStorm-${_pkgver}/jre64" "${pkgdir}/opt/${pkgbase}"
}
