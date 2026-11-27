# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgbase="godot-dev"
_pkgname=(
  "${_pkgbase}"
  "${_pkgbase/godot/godot-mono}"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=4.8beta5
# 1. replace alpha with dev
# 2. replace text with -text
# 3. add -stable if not present
_pkgver="$(printf '%s\n' "${pkgver}" | sed -E 's/alpha/dev/; s/^([0-9.]*)([a-z].*)$/\1-\2/; /-/!s/$/-stable/')"
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
sha256sums=('1a6311d1d8ad2d3b30245642bd203ce4c6124976f840effae430423ce83c8953')
sha256sums_aarch64=('1203117382468c35b8089a5a1e2bb6076868baeb840ae7e7622ec8bd0885396e'
                    '46b23f727f8cebe4ce82e17535a2a3c7e5c8e0ada24d9b7289387b0cff0f9dca')
sha256sums_armv7h=('7dc60b13b87c7c450477395d1552f13eb14f833f5ca5f2d7e53341c8a74eb277'
                   '51e81cfe75998aafeff482090445535e2c98a1b8f862661084a8e04fb5fa8419')
sha256sums_i686=('f06786149a2d9bd3171c8f63ef1e6d35458f6335e5793ba7ebfc577c234decb9'
                 '8ec91f16644d54f5903f03db3d8ce0a4a49514cc37d8cafb6913f6486fa58ec5')
sha256sums_x86_64=('955ecb6d29ef5aaa9536cbb5ee9f0ef001c95efe29fbf0703d43e26aa377f414'
                   '00e1c095389ecc6dab496279ffd2e65aeb043fa70bbf07108b6afd6b89b29d97')
sha512sums=('5e624dfc1556973d5dc1cef77b9d2c3d7b5ec4eb98d557fda9eb353ffbed35a8321576d952643494b18905f1a1debb6db23d73f05971da444877003f128686e1')
sha512sums_aarch64=('d864249842a0444d96752d8f9c7974f215ceca983ac7547e3097c1ca72d8fad00906f40743f75e58e1d632f3efe8a53a0f376e27576567685592c79363e8e068'
                    '9d8eb8aedef060b113486f183a486d02c5f11968995f12959fb52ea81ed3d2f45077c03e7a0bbc6145af4828367a0c3418b5a054412698224e4b520c22fe794e')
sha512sums_armv7h=('c2db32f26e937771180a90cc71dd384ac77b5e4f14c3108983e12632297866a64a7a704384f2bf4f404fc7a45a65a7f64fd51b3505c437c63be797515171ecda'
                   '8def9ce3351e166d25f5021a244f2b2d96eb27ef754dc67d5b22cef4e892b1c97589f1e95647ac7aeef2d47ff098dcc00894c7a48ecdf76e809a53de31315dac')
sha512sums_i686=('5b5e632878b3c3ca8366b68eea117c0be5da453782e25cb4feb62406c5e487675d103bfce3e42a8584a6f601b84d4b9401a7177b4f3e30f702cc17bf91a136b2'
                 '17b993d4d2f82541a57c40e3266aa15f34b3411e030808f1f575ada27049d268eddb696774e5c990c003a5e41632810c42d9a75a92a00a3ca5d8d840d347c669')
sha512sums_x86_64=('37f81c4e3d6c0a9d8ab5304dfe24d32cbd31590cb847b10530466276eb1dac338cd653f8fe6005e1610906cd887ea804d875b85a63da10b3220085fad9ceab18'
                   '00e5a8ebfdd775fc45b85aff2a602d1dbc2d2a55097d2bb920abf21a6636ffe30a7652dc2aa89d210374b37d2e09f2f4534869f6bd1c90a490a62382b310315f')

prepare() {
  cd "${srcdir}/${_pkgsrc}/misc/dist/linux"
  cp -f "org.godotengine.Godot.desktop" "org.godotengine.Godot-dev.desktop"
  cp -f "org.godotengine.Godot.desktop" "org.godotengine.Godot-mono-dev.desktop"

  desktop-file-edit --set-key="Exec" --set-value="godot-dev %f" "org.godotengine.Godot-dev.desktop"
  desktop-file-edit --set-key="Exec" --set-value="godot-mono-dev %f" "org.godotengine.Godot-mono-dev.desktop"

  desktop-file-edit --set-icon="godot-dev" "org.godotengine.Godot-dev.desktop"
  desktop-file-edit --set-icon="godot-mono-dev" "org.godotengine.Godot-mono-dev.desktop"

  desktop-file-edit --set-name="Godot Engine (dev)" "org.godotengine.Godot-dev.desktop"
  desktop-file-edit --set-name="Godot Engine Mono (dev)" "org.godotengine.Godot-mono-dev.desktop"

  # MIME info fix, ref FS#77810
  sed -i 's,xmlns="https://specifications.freedesktop.org/shared-mime-info-spec",xmlns="http://www.freedesktop.org/standards/shared-mime-info",g' \
    "org.godotengine.Godot.xml"
}

package_godot-dev-bin() {
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
  install -vDm644 "org.godotengine.Godot-dev.desktop" "${pkgdir}/usr/share/applications/org.godotengine.Godot-dev.desktop"
  install -vDm644 "org.godotengine.Godot.xml" "${pkgdir}/usr/share/metainfo/org.godotengine.Godot-dev.xml"

  install -vd "${pkgdir}/usr/bin"
  ln -vsf "/usr/lib/${_pkgbase}/${source_artifact%.zip}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

package_godot-mono-dev-bin() {
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
  install -vDm644 "org.godotengine.Godot-mono-dev.desktop" "${pkgdir}/usr/share/applications/org.godotengine.Godot-mono-dev.desktop"
  install -vDm644 "org.godotengine.Godot.xml" "${pkgdir}/usr/share/metainfo/org.godotengine.Godot-mono-dev.xml"

  install -vd "${pkgdir}/usr/bin"
  # mhm
  local source_artifact_fix="${source_artifact%.zip}"
  ln -vsf "/usr/lib/${_pkgbase}/${source_artifact_fix/linux_/linux.}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
