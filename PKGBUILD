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
pkgver=4.7.1
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
sha256sums=('0230d490846467c4fd772cc70b08dc56cb3adfedd55d039de0af74ddfdba00eb')
sha256sums_aarch64=('8f527179cd4ae58b402fa265fe817dc505e5b6b14574f309efe57113be562ac1'
                    '8350cee2b8c4af1739eca3b31dc8885d86158d514de76c0152f03ffbd58e25ce')
sha256sums_armv7h=('54a9e1b2b353322cbd122ed8e42049b4bd9bb7d25f21363199b4c07d1c5a68e1'
                   '14d67d8eac57215e717c3b1748127a1be6c07c1bdbfe7c9f3797593da02af13a')
sha256sums_i686=('bfcf1713c0751cee84a52ed6d13a8b73effedcb650febcd6e0a90d74a6df92fa'
                 'eae0e8ca405564787a798a1e0528e2541c7e0fd2a5baabdd0b07b8f0e6c2b3e7')
sha256sums_x86_64=('c7ff14fd28472c8d4f193043de30278dcf7e5241a1dcf7566b02e27addaa33ba'
                   '6ca7ff0459f1b806900be683c1b0837c607a9c16834c530dc68c81b9fc3ae1f6')
sha512sums=('27bab3cba3963bd19dcb8d7684e48ddf3c9623ccc94bad23f6f1ada8cf55596178f2aa60508e62172b707c88401efd3c4b8f10245a1adbbcd32599d0fb961c47')
sha512sums_aarch64=('de64efe4d936ac0403769e078a73d961a9c647cab04168c5fb5a7fe33728e200a67324ed99368eeb27964e205e72a61e48efb63b52d5de34d12dd6a95ca0fc45'
                    '689fca4a0fae97307e580c4a933794a6fa9175e269e7e0befc80b1b19af197dbe3cdd56879cef05302f939cc16421acb866b1adfa2a8c3816e77ac53e062aa5b')
sha512sums_armv7h=('276bca6f8dbaade1220336eb44259e3f423e1027a8a3d35422d8d8129a208220cbccef48f63dc5f0cd52fe96c7d3d39bf34143d29635e5fcdbe744fda1bb933b'
                   'd1f553ed980d3e2f55ea6a4c6a49a4e68b82d14f4c28214accffe8cc67b31d3a54d069819931071dbffd9058f642ca485614bf5b4c03f3795b34db436901960e')
sha512sums_i686=('8d980dc6919b9002545155a010285ac0d0746b4128f81536f3a409206cb4ad3a6398247d43f5df2de697c190ae1bc3b1b57e28263f6ba93c80a9f4b0155b1387'
                 'c1e193399ae0f98e85bf720b19424f80ac312599bf07533c7118df62202d44c9ef1bbd7198a511927fe1042a81ee402a7cccfa9a15ea94dc0801ffd79f4f49f4')
sha512sums_x86_64=('4ccdab7a48eeccbe8819a2fc1f6262f8d72065d98601bcb3743fcbd7ebd39f373758a788ee3293a05ec5b2c48538266c437404312e372225cd2df273945a2de9'
                   '0dd41f159a358b3cf23898a8d6aa3b346bd91a574b22991bbd3bc812cd414ad1b1d7701de7124bd9818f0d52b3734a885f0edaeab9cb4b2cd1d5049171e304b8')

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
