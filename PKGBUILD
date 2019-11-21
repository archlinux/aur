# Maintainer:  Frank Seifferth <frankseifferth@posteo.net>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=abricotine
pkgver=0.7.0
pkgrel=3
pkgdesc="A markdown editor with inline preview"
arch=('x86_64')
url="http://abricotine.brrd.fr"
license=('GPL3')
depends=('gconf' 'libxss')
makedepends=('npm' 'nodejs-lts-dubnium')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brrd/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('03bc7735be08ceacb412b1fd96d13b8ba14eda629cd8b6c705e8421ee7875442'
            '164d0042ffe461ca0418709a59be29b433055589b661be4d6555c07df42b383c')

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
