# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=abricotine
pkgver=0.3.0
pkgrel=2
pkgdesc="A markdown editor with inline preview"
arch=('i686' 'x86_64')
url="http://abricotine.brrd.fr"
license=('GPL3')
makedepends=('npm')
source=("https://github.com/brrd/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('f17b36273eb9b86b9a45b76a168c70d71e25ba87bc5d4ff75ff06aafb8a1e7d7'
            '48ca6ce5c5f7ac5713ad9b199d8627abb8385f5bbd85b8cd9754da2ee9c11432')

build() {
  cd "${srcdir}/${pkgname^}-${pkgver}"

  npm install
  npm run packager
}

package() {
  cd "${srcdir}/${pkgname^}-${pkgver}"

  install -d "${pkgdir}/opt/${pkgname}"
  cp -r dist/*/* "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname^}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "../${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "icons/${pkgname}@2x.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

# vim:set ts=2 sw=2 et:
