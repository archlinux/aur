# Maintainer: djazz

pkgname=fimfic2epub
pkgver=1.7.22
pkgrel=1
pkgdesc="Tool to generate improved EPUB ebooks from Fimfiction stories"
arch=('any')
url="https://github.com/daniel-j/fimfic2epub"
license=('MIT')
depends=('nodejs')
makedepends=('yarn')
options=(!strip)
source=("https://github.com/daniel-j/fimfic2epub/archive/v${pkgver}.tar.gz")
sha256sums=(
  '68a6a5e0955adc065f864eb44992af6983aae30d0a9a797bced63a1bdf2fc9a5'
)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export YARN_CACHE_FOLDER="${srcdir}/yarn-cache"

  echo "Installing dependencies..."
  yarn install --non-interactive --no-lockfile --ignore-engines

  echo "Building fimfic2epub..."
  yarn run build webpack --standalone

  install -D "bin/fimfic2epub-static" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
