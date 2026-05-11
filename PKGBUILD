_pkgbase="godot-beta"
_pkgname=(
  "${_pkgbase}"
  "${_pkgbase/godot/godot-mono}"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=4.7beta2
# 1. replace alpha with beta
# 2. replace text with -text
# 3. add -stable if not present
_pkgver="$(printf '%s\n' "${pkgver}" | sed -E 's/alpha/beta/; s/^([0-9.]*)([a-z].*)$/\1-\2/; /-/!s/$/-stable/')"
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
sha256sums=('927398b75678cf0e13950934dc7190e558ee33e71141d5f5ca8d80f646596f52')
sha256sums_aarch64=('a2100dedfd53455b9cf9b9fb1cfe74a6e1a4304a584a3076cf7daafb35dbf426'
                    'c245adc209903da3f3f4810824b2ef912d43249d55fedc75d435f4e5a4c0a4c0')
sha256sums_armv7h=('1643108bea020dacd915ed2468986720963afa4d7781a0d78767ea6fd6f93a74'
                   '2e5d11a5d5d482fb9e0f69ac3effd927506896fb8b63b5fefdc985c79e14a55a')
sha256sums_i686=('f2c8c133ba766bd474b06c716b905c8689753f4ebf5a2348a951f3012cbb3c70'
                 'f9f9c1fabc4455435515290364f30338a0db6cf03821782591d3f2d0f5cd9b0e')
sha256sums_x86_64=('f3e7fef48049a11a7669037e44071b6fe3615b5078b4cfb5f8fc8d8c39e82f3b'
                   'eaaf066fffdde90913ed3d23b5e2cf6ac98ec24633b642e6275e936b24ae9c9b')
sha512sums=('3810a97976fd41865801ee2b59544b0880a7847348b62b0b55907c1f98ecb617b4621b52af80f93d09af9a578e266998863175aec5ea1671c11de6c46aeac7a8')
sha512sums_aarch64=('69dd982bb45a5a51aff26e83fc4f1337f4a31cc76b3a87a4161f300ce2bc002714728103690520ec81d0a51d29a948905155b6a338ab5ef19691e3c85f084796'
                    'dd47f149a0614f05ba8c3816bc31922ca9918b810a29b9802af23c138cda4eee8e5cb0369e2637285d2e875200411eed3172e8e74c98db105554125fa914c018')
sha512sums_armv7h=('89947257292fdf63c0217155f4fb32b7c7971981b187558096b31bd0a8249d1b23a1185ff42f7dd81ecaf2e806478528ed42af547f26bf84e0c55a7b4a1a919a'
                   '962cbef8027ea105371b4cfffb4c047e61db507f186d98f64a3f57d58ce237bd1f8571ad02bd4cd26e3eebe56cb00c8823eaa76c96efb3aaf3d7778850124c1e')
sha512sums_i686=('5e013f35a9c83a543a0378658f40fa6f2e7b4ca59b155a2195a8505d895359a000a643cc43bc897a42f725653c9ba95dd2ba43406ca4a380bf5817a5e4524518'
                 '2ae425f0a632bafe8e3db647488204a963029e21cd62a2f13774d49630c7a8d5bd68a6adbcbb15d460c2771279234025d4add2087191b4febf5b9943fb954940')
sha512sums_x86_64=('9e41419e6861886e4caf353d4653dc1a71a12a1f9c83c9f88c76e9c837812f6dd5d0f1cd83410e993785cf9aa2008856194db048209ab08cd2d03e6d1adefc41'
                   '5152fc40fe47dbde04555050b56e25473f281c5056ff877ee6d2e810d50affdcdad3d5b619d890d8558bf04d11b155950d677faa0e134f0064d96d125f6119fb')

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
