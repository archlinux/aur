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
pkgver=4.8alpha1
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
sha256sums=('0ed90c605fd9809819304d0b51356aec279ec5fc8ccb067dfadf1d486db7a956')
sha256sums_aarch64=('676c8593e58e06a73abc3fa06e8cbca68606f564ded78f418e9a23b6983f03ad'
                    '4ca2786817a7d79130841cda27496e52460552c9b81580922b7a7d048638e85c')
sha256sums_armv7h=('b15da3f23fc4365e26a28d706787162e183bdf664b77298afc56bfb997887761'
                   '1888783d757fcbc3d098d4c255c5cdf7295262b55ce893e608d144844eccb7a0')
sha256sums_i686=('2ebd16ec7e1cbd5cdf21804c1c49a58a9adad8653a8a364b2052d54710bd86d4'
                 '878f985dfa6934ce698723bbbdd24329ab4907a38f828c5601ab0b67452841f0')
sha256sums_x86_64=('d237401a358b12b83d83f9fc8a373912f92f29ea806f5c315e0b0577979fdc90'
                   '059f6d4321325cd4c1972f9b2231e981d2d49b6a988cc47e8d1fb7fd4f93f00c')
sha512sums=('e059334477f23c32bbb8a17b5cb90a5022d94a3af0dacccfe00893fe6620e5d530adc6eccbeb30a62f38bdf1d339f036212e06d561bcf6e089b4dc2679628838')
sha512sums_aarch64=('44f330b774962d7b2132da9dbd4c99be35b1829bff77424076fe3678acb2e31ccf27f2e8bdcfbdb9626603e2a5ad39b7e091c5022b8b4a7b702e1858fcc98d08'
                    '84288eeae3196ae78329fbf3bb90533426b4d8ca7fd53ea14a3fc83ecfbaea15a95c9ddf8082a47a248989e6b1fd5806f1da0118ce348a8155d3ef7cc0fc8272')
sha512sums_armv7h=('a0ed3b4614dc759bb98f4e15d973835a8d87feb0b95b6b9df1d6dd81f10bee81ba152966ecdbfb3aeb8aa330738ca1193292c6c3ed87a3325bd957b81f36fda0'
                   '1bba88db0149fbc4a9cdaff5d61f4e224ab3a9e7a86bda5809fb6a92036489caa0d5bc427ae282e7c99fcde9fbfdca4fe74f2b4ed698defda542c8cdeb2fa415')
sha512sums_i686=('b0d3e39bafe63e19c183b239d292a171b6425d1a54ee285f1844a03614122d58d86717f8375ed2fb0a06c79f621dafdf3e0354565d6a56ac328859af33142b99'
                 '3cfdee1c08512bbf647aac4199dd6569e61f33e43ecf7065685a7c64583c290c49ac16926969f8beb1f27ed83f32e071d29243bc11150a8574edd1fb3956b4b6')
sha512sums_x86_64=('ddb49205444f15620ed8d13071312c672b476f8359593f21d67e3c6ed9cdb856042a72ad53babf33d10c85ea0d279725e2eeba0bcb176a2484db84051631364f'
                   '36ba9fe3e94cefa564950973a0378c534a3947b86559dd2f0e1bcdab2096f3225c9bee551573c720a6510622c485c7c0451e4987decdcdcf3d9fa0c476fa9d76')

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
