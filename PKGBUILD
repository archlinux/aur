# Maintainer: BrLi <brli@chakralinux.org>
# Maintainer: xatier

_base_name=jf-openhuninn
_repo=open-huninn-font
pkgname=ttf-${_base_name}
pkgver=2.1
pkgrel=1
pkgdesc='An opensource Chinese font by justfont, based on Kosugi Maru and Varela Round'
arch=('any')
url='https://justfont.com/huninn/'
license=('OFL')
source=("https://github.com/justfont/${_repo}/archive/refs/tags/v${pkgver}.zip"
        "46-jf-openhuninn.conf")
sha256sums=('80a2cefe53f0cf625250ec146fd892f930178b20576cf908bdbb7b3bd37acb64'
            'b71e9b7e2c4c7066c7953eef2eac5275bea77564df1134dd0d5d3a9edaab20ee')

package() {
  cd "${_repo}-${pkgver}"

  install -Dm644 "font/${_base_name}-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/${_base_name}.ttf"
  install -Dm644 font/* "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/doc/${_base_name}/glyphs-chart/"
  install -d "${pkgdir}/usr/share/doc/${_base_name}/image/"
  install -m644 glyphs-chart/* "${pkgdir}/usr/share/doc/${_base_name}/glyphs-chart/"
  install -m644 image/* "${pkgdir}/usr/share/doc/${_base_name}/image/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install fontconfig files
  install -d "$pkgdir/usr/share/fontconfig/conf.default"
  install -Dm644 "$srcdir/46-jf-openhuninn.conf" "$pkgdir/usr/share/fontconfig/conf.avail/46-jf-openhuninn.conf"
  ln -sr "$pkgdir/usr/share/fontconfig/"{conf.avail,conf.default}/46-jf-openhuninn.conf
}
