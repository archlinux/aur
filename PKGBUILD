# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="dolphin-memory-engine"
pkgname="${_pkgname}-bin"
pkgver=2026.04.20
pkgrel=1
pkgdesc="A RAM search made specifically to search, monitor, and edit the Dolphin emulator's emulated memory"
arch=(
  'x86_64'
)
url="https://github.com/aldelaro5/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'dolphin-emu'
  'glibc'
  'libgcc'
  'libstdc++'
  'qt6-base'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}.svg::${url}/raw/refs/tags/${pkgver}/Source/Resources/logo.svg"
  "${_pkgsrc}.desktop::${url}/raw/refs/tags/${pkgver}/.github/assets/${_pkgname}.desktop"
)
source_x86_64=(
  "${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-x86_64-binary.tar.gz"
)
sha256sums=('24cef39d9bd752569dd3853c0726c71a098ef1299be63a21394cac74f27d66b8'
            'fbd3f331ea8f7218eda808c7c9ace7c63522ac1482a9f52f3191ab94cb524775')
sha256sums_x86_64=('935bc5f34675d7da5c0c6d624694aaf9f959370b5b419a32754a8f41dac31efa')

prepare() {
  cd "${srcdir}"
  sed -e 's/TryExec/Exec/g' \
      -i "${_pkgsrc}.desktop"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vDm644 "${_pkgsrc}.svg"     "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
  install -vDm644 "${_pkgsrc}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
