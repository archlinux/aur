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
pkgver=4.7.1rc1
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
sha256sums=('e792ee73e15ad78bf982fd294d80c5d39697770c9ad7fd8e2fe03be10f0222ae')
sha256sums_aarch64=('e68630aa6d65d48c80fe80e4e1b857fbe663bb56b5aeb6575740db192e440d36'
                    '43404d489a2638e5047f6ef72d4c9c375c1ca68cbed239009cdc8a1ba7a80bc7')
sha256sums_armv7h=('09536a7692a5dabf075802a6805ca7e83a43d443a6232c5ccdd7b3cda9c3160b'
                   '8559645d96f59684da88440dcb60b8787efb57b2849cedd0d6f86669ff2e41d0')
sha256sums_i686=('b705165c4b8eec622095e02c97cb625f1061b315c6a55a24af3dd77ebb139164'
                 '205699c73c6556771e15fcc5e345aa1f42838ab4108f4a1c3aeaed29130c63f0')
sha256sums_x86_64=('ad6715d4866fdbef7d849b1b06c64e913cb93ff12dc2c3260f4c40f0196defc5'
                   'd3f3cc2ada9b29073c4ed29b8bdf1ff85efb5e1d8f55af4a6c091daa171255aa')
sha512sums=('91306de4276db7aea4dc5bc80802ea01d79834180d1d90b9daa027d03faa808a83ceead46adfc4830aecaf613c252423797d34fcdaf28cd1332fee8c53024f84')
sha512sums_aarch64=('c8d0f7295cb57f379d1d9c25d3a5916c15c1fa7793d9cff7376f7d08ce67487bdf5f0cbf4018051cf098a642f419b64e70daa874f13dc1badb0462f15ebd5c9e'
                    '1b03f05414800742836ee15cd9d02afdf36e4fee5b1eab128887eea17fb33e50b32eb857e0c1abe63b99b3ffb8fbce4e33681b35cb0705d047f3b36df8dbac3d')
sha512sums_armv7h=('778357f85e04eaceb15333f569a638da282463b9f08aa01c7bb9d77312b1717a8e2559c4d33995c3f03e7338958286aefbad901604c0fb90ef14b7e80918dcc0'
                   '0ab4a1a898b021c41fb1ca7e540a325684b7866cc6df6347d7def656840408edc523deb08932e8e37d3a886de972d5975af0ebd73f1c5a8cd44746650a66c133')
sha512sums_i686=('9f78418864734b0c0633ecb44c3bac8eb2c4177af303e3e8125ddc483e1a2fe66f24d3c8413bb84f35aa67ef4401aa188168c1825852115da081a3eca4a38a16'
                 '59eb3e76937e6f107501844a3cec641efbb22419dc4b937f215cdbcec98bef06fe59f13cbec19124b2b60667303b8a155613b7e03b7507e0779fcc4ae9e67e5d')
sha512sums_x86_64=('81f191b730bf2e68d80c2c829d9186ac6115b167dfda0a3d8bf94e0695083217f653968cf5d79ee4c65b04f869aac8ce4b7f08620f7b8745cf2df8c5df3dd14e'
                   '1dd43036d314619df5c005b20991178d4c62012a773ec2e5bf2b60f97c5f1ad8f5ce368bea76ffc6c00b6cc5f766a5f3e077bb98e37c0090b8ec39a91a26b86e')

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
