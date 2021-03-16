# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck[at]w4it[dot]eu>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>

pkgbase=phpstorm
pkgname=(phpstorm phpstorm-jre)
pkgver=2020.3.3b203.7148.74
pkgrel=1
pkgdesc='Lightweight and Smart PHP IDE'
arch=('x86_64' 'i686')
license=('custom:jetbrains')
url='https://www.jetbrains.com/phpstorm/'
depends=('glib2' 'python')
options=('!strip')
source=("https://download.jetbrains.com/webide/PhpStorm-${pkgver%b*}.tar.gz"
        jetbrains-phpstorm.desktop
        LICENSE)
b2sums=('b4f404f14e06f7d0520304775e2398ca39c2948538f2cbaa678e0283d13e44588e791ff108a5cefc1ac3ab87711e6a1b7549c614a07b472f5162899c31f22ae9'
        'c6f86b243d1b0b9533a59bda7c9036dee0c53b1076052ed69c651f886f745ae69ef9839ab406016d2bc4acad133e4f2d54ff0855caebe05fee47c00b00041f4e'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

package_phpstorm() {
  optdepends=('phpstorm-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if phpstorm-jre is not installed'
              'gnome-keyring: save login/deployment credentials safely'
              'java-openjfx: rendering Markdown files')

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/PhpStorm-${pkgver#*b}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  ln -s /opt/${pkgbase}/bin/${pkgbase}.sh "${pkgdir}"/usr/bin/${pkgbase}
  install -D -m 644 "${srcdir}"/jetbrains-${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -D -m 644 "${pkgdir}"/opt/${pkgbase}/bin/${pkgbase}.svg "${pkgdir}"/usr/share/pixmaps/${pkgbase}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_phpstorm-jre() {
  pkgdesc='JBR (JetBrains Runtime) for PhpStorm - a patched JRE'
  url='https://confluence.jetbrains.com/display/JBR/JetBrains+Runtime'

  install -d -m 755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/PhpStorm-${pkgver#*b}/jbr "${pkgdir}"/opt/${pkgbase}
}
