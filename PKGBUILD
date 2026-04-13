# Maintainer: AlexanderGhosty <byck.sash@gmail.com>
pkgname=cremniy-bin
_pkgname=cremniy
pkgver=0.1.3
pkgrel=1
pkgdesc="Integrated low-level development environment with code editor, HEX editor and disassembler"
arch=('x86_64')
url="https://github.com/munirov/cremniy"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt6-base')
makedepends=('patchelf')
provides=('cremniy')
conflicts=('cremniy')
options=('!strip')
source=(
  "${_pkgname}-linux-${pkgver}.tar.gz::https://github.com/munirov/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux.tar.gz"
  "${_pkgname}.desktop::https://raw.githubusercontent.com/munirov/${_pkgname}/v${pkgver}/${_pkgname}.desktop"
  "${_pkgname}.svg::https://raw.githubusercontent.com/munirov/${_pkgname}/v${pkgver}/docs/cremniy_icon_stroke.svg"
  "LICENSE::https://raw.githubusercontent.com/munirov/${_pkgname}/v${pkgver}/LICENSE"
)
sha256sums=('c17ca3a042c00bb1122c47ab577d0f5de37e70d717b33cd7804849eefbda0496'
            'e96d7a9cadbb2dff2aa1abd925d560c9ae3933fc0842aed32505c8e2ef1c2992'
            'f6c30476d8fce0ca8ab15dfbf538a53fd46ad243b69f8e5b389693a84ed22873'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  patchelf --remove-rpath "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
