# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Aeternus Atterratio <atterratio (at) Gmail.com>

pkgname=drakon-editor
pkgver=1.25
pkgrel=1
pkgdesc="A free cross-platform editor for the DRAKON visual language"
arch=('any')
url="http://drakon-editor.sourceforge.net/"
license=('custom:public_domain')
depends=('sqlite-tcl' 'tcllib' 'tk' 'tkimg')
source=("http://downloads.sourceforge.net/project/${pkgname}/drakon_editor${pkgver}.zip"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        "LICENSE")
noextract=("drakon_editor${pkgver}.zip")
md5sums=('0568c5a77ff44dd37f133d3fea86d8de'
         'fff9a96ac0e38d735452e935207d2892'
         'eadc8e1b7c72f2f6fb438c254fe556e5'
         '9a3c1ca7b17a8c2f86545fc974277587'
         '155472d3f6036fc8ea0eacabbf442ec4')

build() {
  cd "${srcdir}"
  mkdir -p "${pkgname}-${pkgver}"
  bsdtar -xf "drakon_editor${pkgver}.zip" -C "${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install program files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r * "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install a desktop entry
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install a license file
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
