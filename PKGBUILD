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
pkgver=4.7rc2
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
sha256sums=('c5438b148c8fc64b6cd7a9ee419d773739af7d4edc97646724ce29d4531f5f23')
sha256sums_aarch64=('966b0d64262f2305cc9e2147a7b24048e5f003e12846038c653a188cbb33b47e'
                    '2c4f2047ab5acddde17193b557806e172bec16d22e27b5674e9df95018800b2b')
sha256sums_armv7h=('e0e901877c3bb8961094f3ba23cb25db8fef44e0081eb415bb910dc1d3b96e28'
                   'aac94aec49ec5f96da777b42671cf325539ecf02aef9e155650441fbde72f119')
sha256sums_i686=('3fa6185c9ab67e7af2c7b73aad1b8ee74c72986b8766d930af0daa3665498f21'
                 'd2ea6f97e57b4c283861cb321ec5766036f60a3cb2a2109872cc1ad9d02d5790')
sha256sums_x86_64=('ebddea2fb845899fd70242007f09f9d01730244b95f588e6c6bb9d0b2f48b058'
                   '04b490c6c689f73ffc0063acefd83d624cc8d11da9866906461aca44a744a187')
sha512sums=('5c67f03c8216e222c4db8c2d217871404bbbf50be1c0fabc43dccf654134c93a642c35faa045dd8509af131a163b4da814c104fb91bc3df48cd47ac96db8e4e0')
sha512sums_aarch64=('c614be03a76987e0b0a1cf7e26734731ce3c8571b3c7d5476a088d0501aec92947166c138c4d6d11745d097d7df22e0181c7c3755cbb62fd03151e85a4697614'
                    'a77b200d942f797d3ca3071472da7f4899d136e879ec4a9382542f308efb379697cce50cff919eb06250c6abf20abf678206c2e7053d8a099c824aad1cc5cd50')
sha512sums_armv7h=('932e72a9580a3ce0ecbbf7a8c56b53e612b23bda6ecef2546147d3f38a268e4efdb66c5e76cf953291497f38c4e516a7aa2d028d78176b0c0dc75f50111fcc63'
                   'c4d34bfb59353ca153e3f556f02993be0f057c9dfd14511aef90e6d1a8d932e35ebbdeb2b5601a1a251bf4c556c3ae14814ae81b0beca7fba636fbefd4d3627b')
sha512sums_i686=('d051e26d6bd15a2e8392060baae4da7b79770159dd9191b53055e44b259ba6f30c7d2b44089ff119b70bc0353174c24af185c1a694e82190823b273b49799948'
                 '5532ac9a294502490f1ba732f3a311b7da2afa2585ec0517e8a60ecae2998ed93ead3e5c2c00b67a224f042a7d4ec98ea9dd5a3270932937c49ee0c52ff2fdcd')
sha512sums_x86_64=('072cc1bba3df33f31848a3c5c4e94988872711d8d01b7ac14d6b9cb988702a5e56d5e433acfdf2a1f50c27220789a53f12a0c721f339feba096b566affab0d08'
                   '1cd15f499edba94b6df60a5b4fbe8c336aefb2600086ff1b7eb791208a9a9ea9f1e1e56e73668e39cab94b90ecdda57b4e554e31917b650e26daade405577f79')

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

  cd "${srcdir}/${_pkgsrc}/misc/logo"
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

  cd "${srcdir}/${_pkgsrc}/misc/logo"
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
