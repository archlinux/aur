# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Nova Bürky (me@novadragon.space)

_pkgbase="godot-beta"
_pkgname=(
  "${_pkgbase}"
  "${_pkgbase/godot/godot-mono}"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=4.8beta3
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
sha256sums=('e8dc17ba5e1bcbc5ab13c483ec41dec70e29d60976f57592abdc15b65e656006')
sha256sums_aarch64=('9817f563cf370854044833281a307a6b08e82ec3d1fe6bcecdecc810c95039e4'
                    '17424efd4ef4d9d10cf9d0cb18662ed3162b2bc748e428f7e92b608e58864751')
sha256sums_armv7h=('f4a855d7798ada44598b8c666a2bcf114f98d98f612954caa5c2db93cd68d5ad'
                   'c16eb96b9f907cb8adaab6ca31805faa0dcfd37350f0e6b0e76a1dccc8a6b3ef')
sha256sums_i686=('6c44480902f593d44f156b1d5dbee4a4507683f6b2b9db2d139da9fb8ea86a64'
                 '85ce64e5cb197511542a3fe801a44321f0f6aa2ca94766fe7b3a4ad67696f07c')
sha256sums_x86_64=('5595db30bbad4d3076d132ebc8ebafb02aafc3958dc2f730fcbfdab9ea51313c'
                   '3e67bebe9a5d7f2a10a9505e81d76d24b3c1c05b6a82684d51f7791f7744a965')
sha512sums=('dddd96486a0026a72886dd95b8c297c918a446f3f65b7030b660912e170ba5f7c3938ec6a5955689b5d6d8a9dcfe9b5cedb4d4a4dbe52fca76a2f3c1feef4925')
sha512sums_aarch64=('c8b5127ae32f7a52081a67f318742e5d5801c9412ca185cac109c3c7e156896a2e3c276dc1f03524ecbca947080487cde85d8a6911926caa19e84b9a1a4d311c'
                    'f0edcb01334c8ea80bd064cb9391e828eba88aaf4975ab0a4e22665c117efa915448a185c4f08f31dc640e0bc0db015e06eb62ed0e02f9888c8a40a969cd9a39')
sha512sums_armv7h=('2e55d050d607a3cf42225949e663590cfeca2bc4685f97e98c76e772253aceec6271bb81997f2f64f61ca3e66e212254340c13cfd6e44a40b9fbd1089ee45f9c'
                   '3877be2a2c669f27a0b9b7edd97cb08c902bc7246022003cd2606b1a5c52fe8f8814ab7cfc3714b91409b9d340a6df3dc66d9c174f6eccf94fd9485401f78c5d')
sha512sums_i686=('dc0278459d6a358057ac0bc97ba4c89f5ea67b353a849a6c634ac2f7a39ae0069ac1f2e9786cf47a0c51fc98698905db3803b9e902aeeadcadf0425ff19e1e81'
                 'a8f58f5a06b267d73aa742dbdc88025d73c1e352c34279ed12de4196fe38307ea7fcf2f04daf5f3b251201cb21be2cc45fdbcd09e0def60ac3aa9cf5ae5c4439')
sha512sums_x86_64=('c6dfb51e2d305934345042bedcf19ea8f421b774e601cd11b92cd39112d3f8855ab600a4602d458a5509076b647db1171d23440c365ee3d4fc78111958a77a28'
                   '16847cfbb7c5290b617829df6bbd691e4a708c0e980eabb59c39ca3a06d0097de6e8a3fa4e89c8b8f5b9c9c2e37bffdc2928b27faa6491844cc5b0dc54b95902')

prepare() {
  cd "${srcdir}/${_pkgsrc}/misc/dist/linux"
  cp -f "org.godotengine.Godot.desktop" "org.godotengine.Godot-beta.desktop"
  cp -f "org.godotengine.Godot.desktop" "org.godotengine.Godot-mono-beta.desktop"

  desktop-file-edit --set-key="Exec" --set-value="godot-beta %f" "org.godotengine.Godot-beta.desktop"
  desktop-file-edit --set-key="Exec" --set-value="godot-mono-beta %f" "org.godotengine.Godot-mono-beta.desktop"

  desktop-file-edit --set-icon="godot-beta" "org.godotengine.Godot-beta.desktop"
  desktop-file-edit --set-icon="godot-mono-beta" "org.godotengine.Godot-mono-beta.desktop"

  desktop-file-edit --set-name="Godot Engine (beta)" "org.godotengine.Godot-beta.desktop"
  desktop-file-edit --set-name="Godot Engine Mono (beta)" "org.godotengine.Godot-mono-beta.desktop"

  # MIME info fix, ref FS#77810
  sed -i 's,xmlns="https://specifications.freedesktop.org/shared-mime-info-spec",xmlns="http://www.freedesktop.org/standards/shared-mime-info",g' \
    "org.godotengine.Godot.xml"
}

package_godot-beta-bin() {
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
  install -vDm644 "org.godotengine.Godot-beta.desktop" "${pkgdir}/usr/share/applications/org.godotengine.Godot-beta.desktop"
  install -vDm644 "org.godotengine.Godot.xml" "${pkgdir}/usr/share/metainfo/org.godotengine.Godot-beta.xml"

  install -vd "${pkgdir}/usr/bin"
  ln -vsf "/usr/lib/${_pkgbase}/${source_artifact%.zip}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

package_godot-mono-beta-bin() {
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
  install -vDm644 "org.godotengine.Godot-mono-beta.desktop" "${pkgdir}/usr/share/applications/org.godotengine.Godot-mono-beta.desktop"
  install -vDm644 "org.godotengine.Godot.xml" "${pkgdir}/usr/share/metainfo/org.godotengine.Godot-mono-beta.xml"

  install -vd "${pkgdir}/usr/bin"
  # mhm
  local source_artifact_fix="${source_artifact%.zip}"
  ln -vsf "/usr/lib/${_pkgbase}/${source_artifact_fix/linux_/linux.}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
