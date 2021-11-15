# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=dameplus
pkgver=1.0.0beta1
pkgrel=2
pkgdesc="A checkers game"
arch=(any)
url="https://sourceforge.net/projects/dameplus/"
license=('GPL')
depends=(java-runtime)
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgname}/${pkgname}-${pkgver}_linux.tar.gz/download")
md5sums=('b0a390bdfaa271e9e8e91ed5bc1ee5df')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i '/^ARCH.*/s#.*#ARCH=amd64\n\ncd /usr/share/java/dameplus#' start.sh
  cd "${srcdir}"
  gendesk -f -n --pkgname dameplus --pkgdesc "${pkgdesc}" --exec "dameplus" --categories "Game;BoardGame"
  unzip -o "${srcdir}/${pkgname}-${pkgver}/dameplus.jar" textures/logo.png
}

package() {
  mkdir -p ${pkgdir}/usr/{share/java/dameplus,bin}
  cd "${srcdir}/${pkgname}-${pkgver}"
  cp -R . "${pkgdir}/usr/share/java/dameplus"
  rm -rf "${pkgdir}/usr/share/java/dameplus/jogl/i586"
  install -Dm644 "${srcdir}/dameplus.desktop" "${pkgdir}/usr/share/applications/dameplus.desktop"
  install -Dm644 "${srcdir}/textures/logo.png" "${pkgdir}/usr/share/pixmaps/dameplus.png"
  ln -sf /usr/share/java/dameplus/start.sh "${pkgdir}/usr/bin/dameplus"
}

# vim:set ts=2 sw=2 et:
