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
pkgver=4.6.3rc1
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
sha256sums=('10c5b029193cd18e9b191d7e997768a288d56cfbe782ade76250e071fee9472d')
sha256sums_aarch64=('b17475c69328e8463e0bcbc5bb603f57e7744522e09f48f03bffa1a0beeedf7d'
                    'bee4776b9253b969bec1f022e3cfbc1f233d6fd39a66c1d1fed4921b32687826')
sha256sums_armv7h=('5a0a9048beb22a4e5d1083ffd61cf42fb9f60549ed092889ef1f47434d7cf60b'
                   '5b470cf5db31efeea078de7677bb8d8e8a8a99dd0b71e3422c65e953ea1c59dc')
sha256sums_i686=('29c661310507af34205d4a5fa7631ebb9dd7238ad72615b1880eff2fe4eba828'
                 '35e0988efca9e1c4f9b9ccfa93517a4a18384a44b897a3ff6348968455e3667c')
sha256sums_x86_64=('ce4830281fa01544c7f8e5538195af85ac9d32733b5d0e3c7e38560ac0d1e4c5'
                   '4dba0d37dc668d20b2a4425494217729027e0d248f2f0fbc21d353d225776d23')
sha512sums=('8a5446e5918d230b33526c5ecc80800785d901feef0711e5e8df5ddf2eab514a9c67c3d5799f02ace73fa0364577d9657ed5b96d87a1a49e28ef8eaeb8e03887')
sha512sums_aarch64=('df68d055b5eef53b1959e0f14f66f3e6fc10ac8bb4c33a2aae07df05775b17550f92d43961fc57ea83eb050cc51b132e973c8e4df95e8b77454bec74ab2459ef'
                    '2ce784b444665daa07eed64ad023a801061cbd5719dd26023e1e01209a7432b671dd538eb91ea2b07e7e34adad624f9b5c8ca6d9598e8dfdc36c90aa1db7fa1f')
sha512sums_armv7h=('fe8e09679f52b8693eb95f73384c50262e7ca838b1d3aa8b5ab1871bb0f3e0905eb5d45f7d75294f0098db1934dad4d59802dbd3de845aa821aa2c868892aea7'
                   '35bc6699f11df4cf5dd65e1e97099ebf8ab41d953221c651a88d1cd8f5445469df9581f109538fe9496e414231dba6b7eeaec8901841c55e459d4ee8bc3d7013')
sha512sums_i686=('83503db958d48c63fe4d8e804d448bc4ac6595b32847e102bff0f41b46b864dc16992bebbebbd83c9b7b5eb9beccdb8eb48b14ab2efe41b98739b27029942408'
                 '693001745bb8f7ee144c4b747d5fa949ca780165fdd69c60945535a05a1acc839e52df06b6de54980402b94200b77b879d133153ca09acce4f8d1fdfb17a6d61')
sha512sums_x86_64=('0f5325536283d1f88444554bf70ef97defacb347346128c5081aad8510a7c4b18c53cd99937151ee9544e4f3014ba72ed109984f16c2db329f4bb8376c1b10b8'
                   '5c25e589ed175688eb84e54b690a34a8a25b6eadf0c59493b686cece58ab3a2283df7623513d8b84666d4615ca3a43a4aed8d7b40eedf125461440483b33e265')

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
