# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Thomas Perraut <https://github.com/tperraut/>

_pkgbase="godot-rc"
_pkgname=(
  "${_pkgbase}"
  "${_pkgbase/godot/godot-mono}"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=4.6.2
# 1. replace text with -text
# 2. add -stable if not present
_pkgver="$(printf '%s\n' "${pkgver}" | sed -E 's/^([0-9.]*)([a-z].*)$/\1-\2/; /-/!s/$/-stable/')"
pkgrel=2
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
sha256sums=('3465f34ae41cb7d7c17b0516c7cce93cc8a7a4d62331456b7b18e4e1d1b064c2')
sha256sums_aarch64=('c9154154de14acb1f38a6c8618f01f4111ecbd1cdbcecd0a5151be42de2bd1c9'
                    '65ee9699f6112c87bff2191c8e82ed96cf4c48c6e1549b8a9eb2664a8e80c99e')
sha256sums_armv7h=('d78dc08446394b6023624df7e1cead16fc9464409dd44df71f7febb5a88d1e88'
                   '388f44c5fab27e69762c8061c290177156b53f63c71e1add01cefd53ed5a1de0')
sha256sums_i686=('5c750b9ad53955f1e54fdf2dd61f75c6074d4972872b12e64046ec2f2b928c12'
                 '9d96e2ce7578a6f323a4ab02a7d82c518dd139c802d170270ca59a73a134aa29')
sha256sums_x86_64=('30e6b6d141f0cd5bebd629ad1d0ef1324e60091bb20662d026b402ba58c59937'
                   '7d53302c31648ad98b620e8ca5b0c869c1066495770e62b2fa770cfeb004f167')
sha512sums=('02ac162288af72441814961d703b5b48df8a5e12af760fc0ac333c033b1175c11c57db7eb6b3e327af827957e6effa8aedface2c73cdcfa9a52573ce604a9ac9')
sha512sums_aarch64=('47f6101e6df4f3022c752d465689fc2dcddf6ca99cf5d0e7c672f72b03a7412e4a2d9c6cbc38302f59b96870982d71ff8f249ee797c760640ba9e0aec9120147'
                    'b31b8c14312232a2d044ba12bf91518a4224fd274ebb400f52804024ad315dc4ec48e3f42275abc43ed56cbe8c05965358c535ea864c7f3490d925d4ea3d2364')
sha512sums_armv7h=('c787a5f9d25f46b382335a7e052b6aa484e3fa2cdb061a5397ccb7545983f28b58517d17cdb304f0710bbb05031e898e00a9970cf03a486e9cb1ef335a182277'
                   'da269f9854af53c5f52e033a79b0b8730ebdd8d072a3ea858a4327076bf485db35c54eb6945cd2c50d3e5005ecb1bd525995fe6e9908b4eba88ab04b9dee22cc')
sha512sums_i686=('e7e4a73c12d658388d235f78160d13248eb474efc47bbbbddbbfec02afb9577859141d4ecda89b3fe1b95ee5f11e0f53201d5d4e932e840e3cd4214a73c96e04'
                 '3dcb38c9220b2b66053f94ce7930d2eb3f4e63e71c72a1d838d25ebca893b5db95ee6652b603fad5c0666c81db72db6f4b523d64a4bbed86ed9200c10adc4007')
sha512sums_x86_64=('b6e4d5a716085e9649905be2afe77f723f97853544fb33392ce3d32594c730a95d9eb4d1042ed51508904c9e1d996bd36b7c7a2bf4f93f5b1885e98d81b792e7'
                   '3f945f0e28a0bb36b8502df28450a9b89080b3e2e90d831a48e89bd8830fc7d6f958e44097400167e2809945ed1e05cd54c42ac0a62bd08c457c0dd9f8307b99')

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
