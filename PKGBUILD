# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck[at]w4it[dot]eu>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>

pkgbase=phpstorm
pkgname=(phpstorm phpstorm-jre)
pkgver=2019.2.1
_pkgver=192.6262.66
pkgrel=1
pkgdesc='Lightweight and Smart PHP IDE'
arch=('x86_64' 'i686')
license=('Commercial')
url='https://www.jetbrains.com/phpstorm/'
makedepends=('rsync')
options=('!strip')
source=(https://download.jetbrains.com/webide/PhpStorm-${pkgver}.tar.gz
        jetbrains-phpstorm.desktop)
sha512sums=('734a48d703809ae7fd35a05af3f9e5009730683c579e93baed0ea6f19195e77af6249efdb5cbfd7dcc59fe06a03c0c7cf8966e4094d83e774cc37bf4bd45ca95'
            'b10edd04a7d48641bec7a9e23037510b426acb5a3059267b2081ec0fce41272d8de413f0b4c1dddd3387bb0ce330c48b3f7894f4817973cd6d32a74a14af3528')

package_phpstorm() {
  optdepends=('phpstorm-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if phpstorm-jre is not installed'
              'gnome-keyring: save login/deployment credentials safely'
              'java-openjfx: rendering Markdown files')

  install -d -m 755 "${pkgdir}/opt/"
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/share/applications/"
  install -d -m 755 "${pkgdir}/usr/share/pixmaps/"

  rsync -rtl "${srcdir}/PhpStorm-${_pkgver}/" "${pkgdir}/opt/${pkgbase}" --exclude=/jbr

  ln -s "/opt/${pkgbase}/bin/${pkgbase}.sh" "${pkgdir}/usr/bin/${pkgbase}"
  install -D -m 644 "${srcdir}/jetbrains-${pkgbase}.desktop" "${pkgdir}/usr/share/applications/"
  install -D -m 644 "${pkgdir}/opt/${pkgbase}/bin/${pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
}

package_phpstorm-jre() {
  install -d -m 755 "${pkgdir}/opt/${pkgbase}"
  rsync -rtl "${srcdir}/PhpStorm-${_pkgver}/jbr" "${pkgdir}/opt/${pkgbase}"
}
