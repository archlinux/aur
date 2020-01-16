# Maintainer: djazz

pkgname=fimfic2epub
pkgver=1.7.40
pkgrel=1
pkgdesc="Tool to generate improved EPUB ebooks from Fimfiction stories"
arch=('any')
url="https://github.com/daniel-j/fimfic2epub"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=(!strip)
source=("https://github.com/daniel-j/fimfic2epub/archive/v${pkgver}.tar.gz")
sha256sums=(
  '22dd3adb9e2d9c54e3eba47a418dd0ccafb78195702ca9abdc88cec7dcfdd885'
)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo "Installing dependencies..."
  npm install --cache "${srcdir}/npm-cache"

  echo "Building fimfic2epub..."
  npm run -- build webpack --standalone

  install -D "bin/fimfic2epub" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  chown -R root:root "$pkgdir"
}
