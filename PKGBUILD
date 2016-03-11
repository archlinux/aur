# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=abricotine
pkgver=0.3.0
pkgrel=1
pkgdesc="A markdown editor with inline preview"
arch=('i686' 'x86_64')
url="http://abricotine.brrd.fr"
license=('GPL3')
makedepends=('npm')
source=("https://github.com/brrd/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f17b36273eb9b86b9a45b76a168c70d71e25ba87bc5d4ff75ff06aafb8a1e7d7')

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
}

# vim:set ts=2 sw=2 et:
