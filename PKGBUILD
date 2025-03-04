#Maintainer: Franck Lominé <flomine@insa-rennes.fr>
#Previous maintainer: Butui Hu <hot123tea123@gmail.com>
#Previous maintainer: lilac <lilac@build.archlinuxcn.org>

_pkgname=fiji
pkgname=fiji-bin
pkgver=20250302.2217
pkgrel=1
epoch=2
pkgdesc="ImageJ distribution with a lot of plugins for scientific (especially biology related) image processing."
arch=('x86_64')
url='http://fiji.sc/'
license=('GPL')
depends=(
  'freetype2'
  'libnet'
)
makedepends=('gendesk')
optdepends=('ttf-lucida-fonts: fix font rendering, see https://aur.archlinux.org/packages/fiji-bin#comment-1014013')


source=("${pkgname}-${pkgver}.zip::https://downloads.imagej.net/fiji/archive/${pkgver/./-}/fiji-linux64.zip")
sha256sums=('0b91b0644e7fd5f66cbd0b710588e78e2073de26914feb71900a899a92ba2d76')


prepare() {
  echo "Creating desktop file"
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
