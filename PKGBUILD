# Maintainer: djazz

pkgname=fimfic2epub
pkgver=1.7.27
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
  '8afd227f6ddc674765f3792efd7abb04d1c91be0f766b7fb83611bebc635cdb2'
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
