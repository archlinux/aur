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
pkgver=4.7.1rc2
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
sha256sums=('4d33ff23ca46a2e441f3f09ef23e65d1ef4b2055eeb2da06dcbdc1813c6dcd61')
sha256sums_aarch64=('8a758cbe2edb1bb45aec5923f51e35b9869c0dd32a33d594702e02db409ae067'
                    '5cfbf6385eebb544e17cb854cc18dcbace6f224a3283362332750eea3f2b1183')
sha256sums_armv7h=('941783d9cc97a2e91623fa8ef7f48186ed028bbecdfcaf6bb5b34c4983829456'
                   '1dc79c52fa1f8335c77888ef60a9280d64ffc37d56ddf123733059ce9108b8f1')
sha256sums_i686=('5e77e4e26871c59a31c7330e43d133a8f1679f535d0cbb1d4b7798c38ba0213b'
                 '29faa0cd3d787b70d74412a7843abe5b26746e8d4da57e04533f26082c9f95fe')
sha256sums_x86_64=('818c81f69b0801f53bc35fb8d3e75ed43b33ab22e01b1dc37ce1d6e2a68584b3'
                   '84cec4c87b35a12a21b45de4143a8d0ea187f09ee887d9e7adf37472fb237963')
sha512sums=('d2f3ab7c8ea37395f2e4438059894fe9fe59e240d21570cdcaaceff95a2d882f534f1d640234655da2bc56f0566b8db096ae093c0113bc56aa0c7a8ef6d8da94')
sha512sums_aarch64=('174e1b319faf466587d345ca437b65c7300794d50a4ba9c435ac54f1c8cbfd4fa0bdbccc1a8cccb01512abb1c3981dfa05d944966bd075972706fc42ec3b52ab'
                    'abd6bce917135874428e9b7b9f998127ec1ad62623c7095918ba844852c96d3d8999414cf4ee519f8c4950214137324bde5fe0fe5b108aea1ed76d11215df114')
sha512sums_armv7h=('e740657b020166154440a94b342e079b46c0ebde61431ea03cff5f17bc2ab839eaf327b7f3c288d13b00b36096254a7227130842601becec8968eecd98ba0f29'
                   'cb23b5028071d9d8e657dbbab8ecced67f11a3d6f1dcd320b01a3037efcf89800e1a507a3178118f7a0945138aac4d86f0b7e363d06cf2d0ce902f7ef2d98c5b')
sha512sums_i686=('ee6ad8ee54894385fa019539bc106d3ca0fe7d9673a787fe6e874111fefa99d487d530939482dcd986de73855ec3a282348d47629a3448e76537af2b64adfbd6'
                 'bee0cee007425467b1bb38927e96f8354ddba3b9524f16fdfafaabb2fbb636bf8df924097c0f3d22bdc75211ea825cad56d55f4eddde809cabfabbbf57ae68de')
sha512sums_x86_64=('404217530dba5b2fa6ed1b14daeee5486289d7948ea66d96b3cd5cf9127ff7f737411f20d3c2691205ab3ed7492f431223c47d853adff2139a053cd0f16349a6'
                   '6a79671e06d904f4a92bdaa5e8828ffb95ca94d4609a687ad248822b229569d2fce675c85366169b2f9a49861746f2f96a3c9a2b2369145adb5d4db848f9c1f6')

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
