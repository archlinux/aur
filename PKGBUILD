# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=nodejs-jscs
pkgver=3.0.7
pkgrel=1
pkgdesc='JavaScript Code Style'
arch=('any')
url='http://jscs.info/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)

package() {
  npm install --user root -g --prefix="${pkgdir}"/usr jscs@${pkgver}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../lib/node_modules/jscs/LICENSE \
     "${pkgdir}/usr/share/licenses/${pkgname}"

  # Clean up
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \; \
       -or -name ".*" -type f -exec rm '{}' \; \
       -or -name "benchmark" -type d -prune -exec rm -r '{}' \; \
       -or -name "man" -type d -prune -exec rm -r '{}' \; \
       -or -name "test" -type d -prune -exec rm -r '{}' \; \
       -or -name "tests" -type d -prune -exec rm -r '{}' \;
  rm -r "${pkgdir}"/usr/lib/node_modules/jscs/node_modules/JSV/jsdoc-toolkit
}
