# Maintainer: dougefresh <dchimento@gmail.com>
pkgname=carbon-cli
pkgver=0.12.0
pkgrel=1
pkgdesc="Generate decoders and scaffold indexers for Solana programs from Anchor or Codama IDL files"
arch=('any')
url="https://github.com/sevenlabs-hq/carbon"
license=('MIT')
depends=('nodejs')
provides=('carbon-cli')
source=("https://registry.npmjs.org/@sevenlabs-hq/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('f24248f44811f7cbafbd8d709ac451b12b93c6133dcd0539edd34692e8375a99')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  
  # Remove npm cache and other unnecessary files
  find "${pkgdir}/usr" -type d -name .cache -exec rm -rf {} +
  rm -rf "${pkgdir}/usr/etc"
  
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "../../../lib/node_modules/@sevenlabs-hq/${pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
