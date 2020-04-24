# Maintainer:  Frank Seifferth <frankseifferth@posteo.net>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=abricotine
pkgver=1.0.0
pkgrel=1
pkgdesc="A markdown editor with inline preview"
arch=('x86_64')
url="http://abricotine.brrd.fr"
license=('GPL3')
depends=('libxss')
makedepends=('npm' 'nodejs-lts-erbium')
source=("abricotine-${pkgver}.tar.gz::https://github.com/brrd/abricotine/archive/${pkgver}.tar.gz"
        "abricotine.desktop")
sha256sums=('a762d53c1870a93179ddf1de8a24a30141975da84059295c40a99ae18d38e1b3'
            '164d0042ffe461ca0418709a59be29b433055589b661be4d6555c07df42b383c')

build() {
  cd "${srcdir}/Abricotine-${pkgver}"

  npm install --cache ../cache --devdir="${srcdir}/devdir"
  npm run packager
}

package() {
  cd "${srcdir}/Abricotine-${pkgver}"

  install -d "${pkgdir}/opt/abricotine"
  cp -r dist/*/* "${pkgdir}/opt/abricotine"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/abricotine/abricotine" "${pkgdir}/usr/bin/abricotine"

  install -Dm644 "../abricotine.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "icons/abricotine@2x.png" "${pkgdir}/usr/share/pixmaps/abricotine.png"
}

# vim:set ts=2 sw=2 et:
