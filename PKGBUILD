# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=abricotine
pkgver=0.5.0
pkgrel=2
pkgdesc="A markdown editor with inline preview"
arch=('i686' 'x86_64')
url="http://abricotine.brrd.fr"
license=('GPL3')
depends=('gconf')
makedepends=('npm')
source=("https://github.com/brrd/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('6e84be88c8b4d791024d45ba6310374d7dd50a5a36f8dd472d62c50412a2f899'
            'dba9226026a0afb735428bb3203360365939b1c802a120b616038edadea752f4')

build() {
  cd "${srcdir}/${pkgname^}-${pkgver}"

  npm install --cache ../cache --devdir="${srcdir}/devdir"
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
