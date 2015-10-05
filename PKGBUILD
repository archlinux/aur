# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=nodejs-jslint
pkgver=0.9.3
pkgrel=2
pkgdesc='The JavaScript Code Quality Tool'
arch=('any')
url='https://github.com/reid/node-jslint'
license=('BSD' 'custom:modified MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)

package() {
  npm install --user root -g --prefix="${pkgdir}"/usr jslint@${pkgver}

  install -d -m755 "${pkgdir}"/usr/share/man/man1
  mv "${pkgdir}"/usr/lib/node_modules/jslint/man/jslint.1 \
     "${pkgdir}"/usr/share/man/man1

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../../usr/lib/node_modules/jslint/LICENSE \
     "${pkgdir}/usr/share/licenses/${pkgname}"

  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \;
}
