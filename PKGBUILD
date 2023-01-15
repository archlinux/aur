# Maintainer: Tharre <tharre3@gmail.com>
# Contributor: Dennis Hamester <dennis [dot] hamester [at] gmail [dot] com>
# Contributor: J0k3r <moebius282 e4at gmail D0_T com>

pkgname=ftl
pkgver=1.6.12
pkgrel=1
pkgdesc="FTL: Faster Than Light, a spaceship simulation real-time roguelike-like (requires full copy of the game)"
license=('custom:commercial')
arch=('i686' 'x86_64')
url="http://www.ftlgame.com/"
depends=('gcc-libs' 'glu')
makedepends=('imagemagick')
_gamepkg="FTL.${pkgver}.Linux.zip"

# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=("hib::/usr/bin/echo 'Could not find %u. Download manually to \"$PWD\" or setup hib:// DLAGENT in /etc/makepkg.conf.'; exit 1")

source=("${_gamepkg}"::"hib://${_gamepkg}"
        ${pkgname}.sh
        ${pkgname}.desktop)
sha512sums=('9daf0712897a79b8301ecca40a86e4e8c6676cb74fd61e832f570727aed0dce84174702651eadb2267625d5058fa689a49c2e4d14556e66a2baa832784ad9948'
            'ed984d62425f032b2190d7fafff48852825a215bdeb6ea6adaad16de97050915683d676913b2e2d92f73771b66b85fe1bef8426fdaa279b579ceedc6226218ce'
            'cbed4a51aab1527ba71d44ac2a848c4fb233f0037f0b63c38f51c4903fe0e51b8822aff4659cbc7d26652733627eef4a44aef5df0fb57d7749aea4c309c5584d')

package() {
  archive_dir="${srcdir}/FTL.${pkgver}.Linux"
  rm "${archive_dir}/data/FTL.x86"
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/FTL.${pkgver}.Linux/"* "${pkgdir}/opt/${pkgname}/"

  chmod 755 "${pkgdir}/opt/${pkgname}/FTL"
  chmod 755 "${pkgdir}/opt/${pkgname}/data/FTL"
  chmod 755 "${pkgdir}/opt/${pkgname}/data/FTL.amd64"

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -dm755 "${pkgdir}/usr/share/pixmaps/${pkgname}"
  convert "${pkgdir}/opt/${pkgname}/data/exe_icon.bmp" "${pkgdir}/usr/share/pixmaps/${pkgname}/${pkgname}.png"
  install -dm755 "${pkgdir}/usr/share/licenses"
  ln -s "/opt/${pkgname}/data/licenses/" "${pkgdir}/usr/share/licenses/${pkgname}"
}

