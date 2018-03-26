# Maintainer: djazz

pkgname=fimfic2epub
pkgver=1.7.30
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
  'fe9aa57f46a8e37924126c805d7d1026d631ae518eecd7d715406b0e2bdb47a5'
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
