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
pkgver=4.6.3rc2
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
sha256sums=('ec029aef6e86d78805c2764ad99c29609ae6cb85315398e79c8d83cf45cd39bf')
sha256sums_aarch64=('bebbde700116007d89834337edfafcb656efab461ba01cd3d5a8fced08edad49'
                    '26af2a5e83e57daeb32eff88352c9523a75c332b6235d994251148315e8f174a')
sha256sums_armv7h=('57d9d35bf65c2101b92cc7eb884c0a3b50d1dde376b8c44a60e3bfaefb61a0bd'
                   'ad8e04c769223336cc8531945b3c486008f327ad90d62f4cd1f4744383b51bae')
sha256sums_i686=('0306a9fabf2113adb03da533bd945a516934897a681efd1ec54f54466df8e719'
                 '6fdda616b818508a35bfd9e60bcfff8bf8d9f63c654c940989a647e1d352ae82')
sha256sums_x86_64=('633ecfe82cd1ce0b3535c7e339d621ed552b889a4f7f04ae081a579d11949dcb'
                   '0056667591758a0a3dad31c9beedd91857ba47d2f976547e12c0d9413940bca0')
sha512sums=('05e5e1f17d4932ab5b4a976a0543fd4c5dc4e488b059ddb900dc77d3c1b30999f3ae03936744925ed3c80d9157f4f5738be85ee7a7822aab45158a7a1975c5f3')
sha512sums_aarch64=('ebb4436c60dbd41564e7aadaafbbb4acefe56cf64b1e1179ff78fc600e822a1c7b23a80c2bb027ad20191daf599ff2b780fd5c9e7fb4983dde43586d7d3abb86'
                    '938f33d30417e0794051aa9f4a0363901af44a33d78a65d2e170bc9d51bfcdd4483b33e8efe7e1766c82d603d6602504bfb6fbc0be355160f5ab4c3f3e93211e')
sha512sums_armv7h=('36e859afab07f45db059b9d06b48765d209f477c2ff07efb28e161325ae4f7724eed8a321314d89d16558c41c6726ded9114f03127666592a2cc89d237ba253d'
                   '1244773eb40f80ca2d053ea50a1d71c69680581a3382364b32d20a6403c5875747edf1900ee6aef39025ba9586c788d6a032c1e3cf44bfec4e775efb7ce9cde7')
sha512sums_i686=('660efffcc177a87497081e07fdd940b2d62260c1d26bb7cb88d70a79ae1240e27a9298dd656d39381d82410c7d9630c577f53864ff6f3fc2467d4c322a5194c1'
                 '6c4d10c3eafaeb3deca6b2e7a2d092ed1ed2a9d1886cc127fff2a99d1ae277e6b7fbbe8a15e75e58face4357360cca9cfac6586ce7497124de5520c926efb543')
sha512sums_x86_64=('869fe82b48a170b1c40436ee7fd126deb9e15a1ef29b967db7126358cd7ee3bd56d709f8191581de319d60c0767035eda3b254333079ad83327849a936d08265'
                   '1933a443f8e2950e22434a6b193101ce40a517d53b0271e91b0038b28577b38d833d4e829c3bdea6b02f79ec8776634862d9e6d663873c3e410e142edc93e4f7')

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
