# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=dooble
_repourl="https://github.com/textbrowser/dooble"

pkgname=dooble-bin
pkgver=2021.11.05
pkgrel=1
pkgdesc="Dooble is the scientific browser"
arch=('x86_64')
url="https://textbrowser.github.io/dooble/"
license=('BSD')
conflicts=('dooble')
options=('!strip')
depends=('alsa-lib' 'fontconfig' 'libgl' 'libxcomposite' 'libxkbcommon' 'libxrandr' 'nss')
source=(
  "https://github.com/textbrowser/dooble/releases/download/${pkgver}/Dooble-${pkgver}_amd64.deb"
  "LICENSE-${pkgver}::${_repourl}/raw/${pkgver}/LICENSE"
)
noextract=("Dooble-${pkgver}_amd64.deb")
sha256sums=(
  'f0a34443b42efb5d21d4bae856fb760c6c54864c6688d5a0644c738f751cc9cb'
  'c60bf2d6a8bfdf7c7418bba91c6767cbb4b48dccae36dd5d9ffdb48f756815dd'
)

package() {
  bsdtar -O -xf "Dooble-${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Permission fix
  find "${pkgdir}" -type d -exec chmod 755 {} +

  # Documentation
  install -d "${pkgdir}/usr/share/doc"
  ln -s "/opt/dooble/Documentation" "${pkgdir}/usr/share/doc/${_pkgname}"

  # License
  install -D -m644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
