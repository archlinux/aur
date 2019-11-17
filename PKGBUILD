# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=fiji
pkgname=fiji-bin
pkgver=2.0.0_pre_10
epoch=1
pkgrel=1
pkgdesc="ImageJ distribution with a lot of plugins for scientific (especially biology related) image processing."
arch=('x86_64')
url='http://fiji.sc/'
license=('GPL')
depends=(
  'freetype2'
  'libnet'
)
makedepends=('gendesk')

source=("https://downloads.imagej.net/${_pkgname}/latest/${_pkgname}-linux64.tar.gz")
sha256sums=('96cff501cb5e5e29f445a515c2aef1b85b39366e0ca9ef70a3c7dc5e986e1ba5')


prepare() {
  echo 'Creating desktop file'
  gendesk -f -n --pkgname ${_pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories "Graphics;Science;ImageProcessing;" \
    --icon "${_pkgname}" \
    --exec ${_pkgname}
}

package()
{
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/pixmaps"
  mv "${srcdir}/Fiji.app" "${pkgdir}/opt/${_pkgname}"
  cp "${pkgdir}/opt/${_pkgname}/images/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  ln -s "/opt/${_pkgname}/ImageJ-linux64" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/fiji.desktop" "${pkgdir}/usr/share/applications/fiji.desktop"
}
