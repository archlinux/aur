# Maintainer: dreieck

_depends="android-studio-beta"
_provides="android-studio"
_pkgname="${_depends}-${_provides}-provides"
pkgname="${_pkgname}"
pkgver=2023.2.1.1
pkgrel=1
pkgdesc="Dummy/ meta package that symlinks '${_depends}' to '${_provides}', and satisfies '${_provides}' dependencies."
url="https://aur.archlinux.org/packages/${_depends}"
arch=("any")
license=('custom: public domain')
depends=(
  "${_depends}"
)
provides=(
  "${_provides}=${pkgver}"
)
conflicts=(
  "${_provides}"
)
source=(
  'license-metapackage-pd.txt'
)
sha256sums=(
  '1e86f8ac1ad7315c76f4db8bf6a1dbdde6825ac95ff468e431bbe452b6865ae6'
)

pkgver() {
  pacman -Q "${_depends}" | cut -d ' ' -f 2 | sed -E 's|-.*||'
}

package() {
  install -dvm755 "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -sv "${_depends}" "${_provides}"

  install -dvm755 "${pkgdir}/opt"
  cd "${pkgdir}/opt"
  ln -sv "${_depends}" "${_provides}"

  install -dvm755 "${pkgdir}/usr/share/applications"
  cd "${pkgdir}/usr/share/applications"
  ln -sv "${_depends}.desktop" "${_provides}.desktop"

  install -dvm755 "${pkgdir}/usr/share/pixmaps"
  cd "${pkgdir}/usr/share/pixmaps"
  ln -sv "${_depends}.png" "${_provides}.png"

  cd "${srcdir}"
  install -D -v -m644 "${srcdir}/license-metapackage-pd.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.public-domain.txt"
}
