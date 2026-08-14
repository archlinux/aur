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
pkgver=4.7.2rc1
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
sha256sums=('f99d07e4be58c6b1aed706853cb61a1b645e08893671a23054b6d5edd8276cb2')
sha256sums_aarch64=('58c246e85e97b1d9119a15965a277c7650429fbc6e978e4762c3331c00fa019c'
                    '599a2d273065b5b5fd1491516cf59e918f3f3379ae481233251932e508814eba')
sha256sums_armv7h=('05de50d28508d4e3fe41175f578dc2f8d12b2ac0f4f9f5f1caa3ef66c43452b9'
                   '6602606604ade185d4f9da3dc419d0be694a400cb39c76a8133bb7f1e82b9c20')
sha256sums_i686=('03eebd076d14250b0937261b79926f237e415f7254d092ca2c41e76a771bb148'
                 'ab06f8aca75f96b0c743c222f1579a3e750dd6c8bf391f1d41d7a12fd453ca55')
sha256sums_x86_64=('b50091b5314cd1c063fc1fb61589a5b5408028500d06b0600d5a4550079f0681'
                   '7f52418c7657cad06693219ef9afcd79decddaa4fc11496ae90088f219462fc2')
sha512sums=('dfad6199fba290a2c40e91626b0c5a28f848d30b4b485685f6dc8665e90063d3b45df1bca947b2795bce5d7cf6fc39dbee8fb171d55ad0471a145a9dfbced3d2')
sha512sums_aarch64=('d888c568ef589e5e990ef84ed0c46b988f0fedb814ac1f9f5a366fa388bef872120afb1b2e152fb95c3f4091cf51a03fa71a0b6b2f1963b375d6b6e2f21850e7'
                    '9250fbc27710bcc67d4f0c76954a2c3ac1c5e12d533337b7bd86e960f828cb3ce4346a421bca668bf088b1cca137a258aba508713a00f6074effd22a466a8d0d')
sha512sums_armv7h=('f511ebf766ef6aaf98615fced1c429a15a3e51294ac9b40d0948647fc36f489e522a060781f58a3a72477042b0dfa3ba3b73e7b8c6d3963a0bc5284a24a5648d'
                   'b75912370a08ed8a343d3380575db2856f93cadf086586acfd1a96eb6727dc8c152b07ae92d82ac52d3093ce587814b46b675a48deac82d4405192d14ee16f10')
sha512sums_i686=('f529722be890147b24c7f8e02bec54b6c8cae802cc96799a874c55bb3414598b7832d81165656abbee2717e1ec3cb8061a0293bf694aa9b064f14db68efa4097'
                 'e818040f3691d3be90fe2d0a1cd0d0793a2e425014ca6dbd141d0152c9a0e63ee8536132e87d5f9c323401d2ac0262aa2fb0c5330e59530016bac45360ff0d7d')
sha512sums_x86_64=('d349a9b51002ffa6741da8130fa1b44fdfa063585c45d9a28e7c0e7ce269ce12bac26011cbcb4e065f10e21db4d33c50e7d280fd19e1b3239928ef11ea5950f6'
                   '0b2809b3b5ea18748f6e909cb9b15c86a518effb7f07b997fcde3391418bb9cbbc494607e1209a458f0d9116be24baf6a67574253dd6238c96d5869e21ad60c4')

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
