# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Thomas Perraut <https://github.com/tperraut/>
# Contributor: Nova Bürky <novadragon.space>

_pkgbase="godot-rc"
_pkgname=(
  "${_pkgbase}"
  "${_pkgbase/godot/godot-mono}"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=4.6.3
# 1. replace text with -text
# 2. add -stable if not present
_pkgver="$(printf '%s\n' "${pkgver}" | sed -E 's/^([0-9.]*)([a-z].*)$/\1-\2/; /-/!s/$/-stable/')"
pkgrel=1
pkgdesc="Advanced cross-platform 2D and 3D game engine"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://godotengine.org"
_url="https://github.com/godotengine/godot-builds"
license=(
  'MIT'
)
makedepends=(
  'desktop-file-utils'
)
_pkgsrc="godot-${_pkgver}"
source=(
  "${_url}/releases/download/${_pkgver}/${_pkgsrc}.tar.xz"
)
source_aarch64=(
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_linux.arm64.zip"
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_mono_linux_arm64.zip"
)
source_armv7h=(
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_linux.arm32.zip"
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_mono_linux_arm32.zip"
)
source_i686=(
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_linux.x86_32.zip"
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_mono_linux_x86_32.zip"
)
source_x86_64=(
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_linux.x86_64.zip"
  "${_url}/releases/download/${_pkgver}/Godot_v${_pkgver}_mono_linux_x86_64.zip"
)
# https://github.com/godotengine/godot-builds/tree/main/releases
sha256sums=('2261028c0dfc10e0cf4800a5b2e5a57ea241f72965162327f5764d536a69a46a')
sha256sums_aarch64=('90c70382eee1542904bf507b9bdc6e62a230ac73fd214bf3887a9e0a4d85aeed'
                    '970d2fecb66d8cff7457903e291cac4293e2468d24375db58b747a0f8b6c58e4')
sha256sums_armv7h=('9db8b77e916d45f9368c7654b9fa9b0e9b03dacd032118ad854f96c6e62c21b9'
                   '17054d83892fefb920a4a00b06d7cec4ceee877ceec8acd2ca4deefe5fb178fa')
sha256sums_i686=('03acad0ea2713954c3b499eaf3a2863892996100b91e58023bb125edb07f6292'
                 'a5a96b09bfcfabb2ff2f50aa3ba0f24ec41b2437729c8ccbaf0045c91b724b60')
sha256sums_x86_64=('d0bc2113065e481c9c2c2b2c37daa4e8be3fe9e27f0ab9ab0b6096e9a37907f3'
                   '702a8a6785060203fd46373adf864586ecf0c377ac685d7107dde66b1eba0a9e')
sha512sums=('b3e4c63eae7b7e0c47da07ae64d49dca5bf033912ea0a0da5440fcee48b4eb16c75e446374e7916c4ca2c6ff39ed7f3833e4cc2761df73765a660f715770f803')
sha512sums_aarch64=('447381de9ccc68aa02f37e279322289f7ddf88ce9b839ed88a97c73e01cdcda46e026897e5d88722e08491f71b3d74f72dfeb22ec7e3add6fd3e9bfbbdad6751'
                    '3a4471e1b596f0e45bb5386f4b8d7f44e661a4aba7d5abdca578d28e8cb499e99438abffac05bf6e7432ee56b6709fc32b4c2c2309031604ee2a5c3da1a86519')
sha512sums_armv7h=('806724d8cdecba06b4073fec3cab04764e15cfcca7265026d9a9c8a2388b1c06186d0fd4a8eec96b52f8db18c983b9721877b58f7f6599fbd980b00fcd8b2874'
                   '3cc742b943543fce8ff81348a6441abc89162ce33c44b827a3d60312f256c860352d54b4857f98c2f60d100fd19f00eb02e526346ce21d967a8e213de49f83f4')
sha512sums_i686=('b9833050eb7e92ca59048f34ec69dc64c384a0f8295200f47af27292ffaf48f9634d3fe1bbc17327edc1060b57a2ed08d8dd90ccf1fcd2476c52aa94ddd50c54'
                 'da42ea325feba27cb72f9bf1b767679ce124416f2ef8b7246e73cb0ee36271e4767e894f5063ec02dbc2974996bb2df2588b91159c98feeaa17645e7c412fe9c')
sha512sums_x86_64=('a035258da32b77f966a5376f9fa29c30a6adde826a85ba918e1605bd1fc9823eba7d85f1dd5e748956bd2ba72827c0025ffa11bb82aec91128c407a2e723c99c'
                   '962c4f5fd3a704de36c9dedcb2f5f6c973065ac8ed8fd6e12c7ebf7e48c3852d774bcef2ccf76b50b206c0c564ceea54315e2943e76e397529923e7de680508e')

prepare() {
  cd "${srcdir}/${_pkgsrc}/misc/dist/linux"
  cp -f "org.godotengine.Godot.desktop" "org.godotengine.Godot-rc.desktop"
  cp -f "org.godotengine.Godot.desktop" "org.godotengine.Godot-mono-rc.desktop"

  desktop-file-edit --set-key="Exec" --set-value="godot-rc %f" "org.godotengine.Godot-rc.desktop"
  desktop-file-edit --set-key="Exec" --set-value="godot-mono-rc %f" "org.godotengine.Godot-mono-rc.desktop"

  desktop-file-edit --set-icon="godot-rc" "org.godotengine.Godot-rc.desktop"
  desktop-file-edit --set-icon="godot-mono-rc" "org.godotengine.Godot-mono-rc.desktop"

  desktop-file-edit --set-name="Godot Engine (RC)" "org.godotengine.Godot-rc.desktop"
  desktop-file-edit --set-name="Godot Engine Mono (RC)" "org.godotengine.Godot-mono-rc.desktop"

  # MIME info fix, ref FS#77810
  sed -i 's,xmlns="https://specifications.freedesktop.org/shared-mime-info-spec",xmlns="http://www.freedesktop.org/standards/shared-mime-info",g' \
    "org.godotengine.Godot.xml"
}

package_godot-rc-bin() {
  depends=(
    'glibc'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  install -vDm755 "${source_artifact%.zip}" -t "${pkgdir}/usr/lib/${_pkgbase}"

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE.txt"

  # cd "${srcdir}/${_pkgsrc}/misc/logo"
  install -vDm644 "icon.svg" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.svg"

  cd "${srcdir}/${_pkgsrc}/misc/dist/linux"
  install -vDm644 "godot.6" "${pkgdir}/usr/share/man/man6/${pkgname%-bin}.6"
  install -vDm644 "org.godotengine.Godot-rc.desktop" "${pkgdir}/usr/share/applications/org.godotengine.Godot-rc.desktop"
  install -vDm644 "org.godotengine.Godot.xml" "${pkgdir}/usr/share/metainfo/org.godotengine.Godot-rc.xml"

  install -vd "${pkgdir}/usr/bin"
  ln -vsf "/usr/lib/${_pkgbase}/${source_artifact%.zip}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

package_godot-mono-rc-bin() {
  depends=(
    'glibc'
    'dotnet-sdk'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  local source_array="source_${CARCH}[1]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  install -vd "${pkgdir}/usr/lib/${_pkgbase}"
  cp -aT --no-preserve=ownership "${source_artifact%.zip}" "${pkgdir}/usr/lib/${_pkgbase}"

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE.txt"

  # cd "${srcdir}/${_pkgsrc}/misc/logo"
  install -vDm644 "icon.svg" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.svg"

  cd "${srcdir}/${_pkgsrc}/misc/dist/linux"
  install -vDm644 "godot.6" "${pkgdir}/usr/share/man/man6/${pkgname%-bin}.6"
  install -vDm644 "org.godotengine.Godot-mono-rc.desktop" "${pkgdir}/usr/share/applications/org.godotengine.Godot-mono-rc.desktop"
  install -vDm644 "org.godotengine.Godot.xml" "${pkgdir}/usr/share/metainfo/org.godotengine.Godot-mono-rc.xml"

  install -vd "${pkgdir}/usr/bin"
  # mhm
  local source_artifact_fix="${source_artifact%.zip}"
  ln -vsf "/usr/lib/${_pkgbase}/${source_artifact_fix/linux_/linux.}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
