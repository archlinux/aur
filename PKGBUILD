_pkgbase="godot-beta"
_pkgname=(
  "${_pkgbase}"
  "${_pkgbase/godot/godot-mono}"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=4.7beta4
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
sha256sums=('e54dd65ff598ad3012221cdc333d1a6ebb723054ab2bc1d1d405f22d5207e7ae')
sha256sums_aarch64=('a17c41c29d75c536c76c3d4957198d03a8605fa198b97ebe2530b45520192593'
                    '32f15d9a2cd5af40077ffc35f64706d08288a9070f2a404edc280039dc82d822')
sha256sums_armv7h=('db39166beb7dfab3a6ceb29d93ca5bbda882fb3ac8f362d1969dc18a8937af06'
                   '0063ec93afb10440a940059b8ce0e1ad6535b5fb83bde8d50ce01b552e9f211a')
sha256sums_i686=('c8572ec7af251f0ffed9dd7a56f7ae5ec4eb550cde8eef122cf1f241e538bcb4'
                 'f1a691a79d074fc6e39bc874ee8642a6765af717ddb36fdc2ff93506f8f9a215')
sha256sums_x86_64=('af268293468e1c4fa37f0069da1e8028c64e23dc09de6a721841fb91cd4e178d'
                   '6f0d2a540dccd4f036fa736ffce60aff7e15fa69729614c21a2799c9725da891')
sha512sums=('0125c3162843d38763f4b60ee48e2782729e10f9f02e98a935e29b4b461bf3a14e95a1dc991a0a225f5870f2cb0df3ba488969eab3f26bad72fd86de7077a9fa')
sha512sums_aarch64=('4bb6f48b8d094cae3c97dc8472ccb1752b70ac1da22749e6e629357117128b26d5497750479a67b15442559a58a86954ebac0df0299913941ae68896117bbf38'
                    'd152af79c9f3d3b427a2e35df43fd5c329c55e65161a4d2cadc99ab317ba9c3649a4582e2b246ed02ae6ec0679f8a9a621f48e7c23de5375865b49a67c8fec30')
sha512sums_armv7h=('6325807a620a0ba4a6adca1470ad636b73e7043a809f513a87d3be8fe9f719347e8aad028c25c974b70fb57893c4dde895ff0135bc226a996bdc81813dcae806'
                   '2e9af202f3760739a90d6f42b5a249bbc0051be9cf6c69b34e1e5f187e4657abfadabe4afe945d638a269586955a49bdb769a24bb312c386b02d0a667571b633')
sha512sums_i686=('468c0f8a17417768814f7cd8ed37513c1db57f715b200819e82a3b95678134f49d3805e47f4323a1506369b9ee4d919b74bcf217a0abdff72631f4b0222aed30'
                 'e5a57aa0b2ad5b9ddbbf017aff59c6efbb3fd758d675d04abc5dfd9705f85a327fbcacf0b35a281194e363fbb73b3dc829c2d00548acc5c39a20654d6a9793bb')
sha512sums_x86_64=('b954afbe1b148f97b36316d58e0350e3e15d7402aa9b5d5c5897873730221ae76db12a260a7a554b1933e0b8cbe16f23040da61515514eebf006228b6967eaaa'
                   '2f2edd71e42c7fbc06c24e895d3d027c5a10660aa1e8d6e6a72d40a50a39c46ee1706d9ad9c004beb94fb7cd59c051f92f441ec5fcfdaa034222cca368a0d7e6')

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
