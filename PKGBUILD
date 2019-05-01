# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=pyright
pkgver=1.0.20
pkgrel=1
pkgdesc="Type checker for the Python language"
arch=('any')
url="https://github.com/Microsoft/pyright"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(
  "https://github.com/Microsoft/pyright/archive/${pkgver}.tar.gz"
)
sha256sums=(
  'b146746a90064ce64ad52386ae9405dbd6afa3503db59f234ab94df0d5f4e711'
)

prepare() {
  rm -rf "${pkgdir}/usr/lib/node_modules/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm run install:all
  npm run build
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/node_modules/${pkgname}"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${srcdir}/${pkgname}-${pkgver}"

  cp -r dist "${pkgdir}/usr/lib/node_modules/${pkgname}/dist"
  install -Dm755 index.js "${pkgdir}/usr/lib/node_modules/${pkgname}/index.js"
  ln -s "/usr/lib/node_modules/${pkgname}/index.js" "${pkgdir}/usr/bin/pyright"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/docs"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
