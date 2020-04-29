# Maintainer:  Frank Seifferth <frankseifferth@posteo.net>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=abricotine
pkgver=1.0.0
pkgrel=2
pkgdesc="A markdown editor with inline preview"
arch=('x86_64')
url="http://abricotine.brrd.fr"
license=('GPL3')
depends=('libxss')
makedepends=('npm' 'nodejs-lts-erbium')
source=("abricotine-${pkgver}.tar.gz::https://github.com/brrd/abricotine/archive/${pkgver}.tar.gz"
        "abricotine.desktop")
sha256sums=('ed12ba3d518b87bbd965b09a25c931d827c2250deb6af0d6c5137ff3795a0575'
            '164d0042ffe461ca0418709a59be29b433055589b661be4d6555c07df42b383c')

build() {
  cd "${srcdir}/abricotine-${pkgver}"

  npm install --cache ../cache --devdir="${srcdir}/devdir"
  npm run packager
}

package() {
  cd "${srcdir}/abricotine-${pkgver}"

  install -d "${pkgdir}/opt/abricotine"
  cp -r dist/*/* "${pkgdir}/opt/abricotine"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/abricotine/abricotine" "${pkgdir}/usr/bin/abricotine"

  install -Dm644 "../abricotine.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "icons/abricotine@2x.png" "${pkgdir}/usr/share/pixmaps/abricotine.png"
}

# vim:set ts=2 sw=2 et:
