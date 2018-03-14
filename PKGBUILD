# Maintainer: djazz

pkgname=fimfic2epub
pkgver=1.7.16
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
  'd54d1da674f91df54b0aae433cdc4cc4baa3a4fb6dd2d476cf0f4d6be056b1bd'
)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm install --user root --cache="${srcdir}/npm-cache"
  npm install --user root --cache="${srcdir}/npm-cache" --prefix "${srcdir}" removeNPMAbsolutePaths
  "${srcdir}/node_modules/.bin/removeNPMAbsolutePaths" . 2>&1
  npm run dev webpack -- --standalone
  install -D "bin/fimfic2epub-static" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
