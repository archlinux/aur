# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=Merrit
_pkgname=Nyrna
pkgname=${_pkgname,,}-bin
pkgver=2.25.0
pkgrel=1
pkgdesc='Suspend games and applications at any time and resume whenever you wish'
url="https://github.com/${_pkgauthor}/${_pkgname,,}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname,,}/v${pkgver}"
arch=('x86_64')
license=('GPL3')
depends=('glib2' 'gtk3' 'libkeybinder3' 'libappindicator-gtk3' 'util-linux' 'wmctrl' 'xdotool' 'xz')
makedepends=('tar' 'gzip')
conflicts=("${_pkgname,,}")
provides=("${_pkgname,,}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md"
        "DESKTOP-${pkgver}::${_urlraw}/packaging/linux/codes.merritt.Nyrna.desktop"
        "ICON-${pkgver}::${_urlraw}/assets/icons/codes.merritt.Nyrna.png")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-Linux-Portable.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '9b7df10497c04c32109da509ea9f844037a8b660e09c27f734a9031d3ee4db08'
            '28472abdbc7fbc4a19cfe4a808fb8eb69604621981c2e17a6b95bd22d08f7554'
            '7e4aa2e0d19bc204813521afa7dc16c5b69798a92484379666849ba351066f4e')
sha256sums_x86_64=('5a9eb824b908d252764d5cb1a2978f31d54f6b244f6c7e86c2da5ad598e69d7b')

prepare() {
  cd "${srcdir}/"

  sed -i -e "s/merritt/merrit/g" "${srcdir}/DESKTOP-${pkgver}"
}

package() {
  cd "${srcdir}/"

  install -dm0755 "${pkgdir}/opt/${_pkgname,,}"

  cp -r "${srcdir}/data" "${pkgdir}/opt/${_pkgname,,}"
  cp -r "${srcdir}/lib" "${pkgdir}/opt/${_pkgname,,}"

  install -Dm0755 "${srcdir}/${_pkgname,,}" "${pkgdir}/opt/${_pkgname,,}"

  install -dm0755 "${pkgdir}/usr/bin/"
  ln -s "/opt/${_pkgname,,}/${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"

  install -Dm0644 "${srcdir}/DESKTOP-${pkgver}" "${pkgdir}/usr/share/applications/codes.${_pkgauthor,,}.${_pkgname}.desktop"
  install -Dm0644 "${srcdir}/ICON-${pkgver}" "$pkgdir/usr/share/pixmaps/codes.${_pkgauthor,,}.${_pkgname}.png"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
