# Maintainer: bohoomil <@zoho.com>

pkgname=ttf-umeplus-ibx
_name=umeplus-fonts
pkgver=20161108
pkgrel=1
depends=('fontconfig')
pkgdesc="UmePlus fonts are modified Ume and M+ fonts for Japanese."
url="http://www.geocities.jp/ep3797/modified_fonts_01.html"
arch=('any')
groups=('infinality-bundle-fonts-extra')
conflicts=('ttf-umeplus')
license=('custom:Freeware')
source=(http://rwthaachen.dl.osdn.jp/users/11/11274/${_name}-${pkgver}.tar.xz
        40-umeplus.conf
        90-tt-umeplus.conf)
sha1sums=('645440245d332218ecd8526e9686078943c4c1bb'
          '0114cbd18c3d3e748f9a0fc224fe96479b72660e'
          '72a8075bd2aee68a65366bd39f0c87306814ebdc')

package(){
  cd "${_name}-${pkgver}"

  install -D -m644 docs-mplus/LICENSE_E \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING_En

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  cd "${srcdir}"
  install -D -m644 40-umeplus.conf \
    "${pkgdir}"/etc/fonts/conf.avail/40-umeplus.conf
  install -D -m644 90-tt-umeplus.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-umeplus.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/40-umeplus.conf .
  ln -s ../conf.avail/90-tt-umeplus.conf .
}
