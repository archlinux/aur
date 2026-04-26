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
pkgver=4.7beta1
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
license=(
  'MIT'
)
makedepends=(
  'desktop-file-utils'
)
_pkgsrc="godot-${_pkgver}"
source=(
  "https://github.com/godotengine/godot-builds/releases/download/${_pkgver}/${_pkgsrc}.tar.xz"
)
source_aarch64=(
  "https://github.com/godotengine/godot-builds/releases/download/${_pkgver}/Godot_v${_pkgver}_linux.arm64.zip"
  "https://github.com/godotengine/godot-builds/releases/download/${_pkgver}/Godot_v${_pkgver}_mono_linux_arm64.zip"
)
source_armv7h=(
  "https://github.com/godotengine/godot-builds/releases/download/${_pkgver}/Godot_v${_pkgver}_linux.arm32.zip"
  "https://github.com/godotengine/godot-builds/releases/download/${_pkgver}/Godot_v${_pkgver}_mono_linux_arm32.zip"
)
source_i686=(
  "https://github.com/godotengine/godot-builds/releases/download/${_pkgver}/Godot_v${_pkgver}_linux.x86_32.zip"
  "https://github.com/godotengine/godot-builds/releases/download/${_pkgver}/Godot_v${_pkgver}_mono_linux_x86_32.zip"
)
source_x86_64=(
  "https://github.com/godotengine/godot-builds/releases/download/${_pkgver}/Godot_v${_pkgver}_linux.x86_64.zip"
  "https://github.com/godotengine/godot-builds/releases/download/${_pkgver}/Godot_v${_pkgver}_mono_linux_x86_64.zip"
)
# https://github.com/godotengine/godot-builds/tree/main/releases
sha256sums=('4c99ebfc07a964d34fcfb9238b9ec1a843d89f88838acdc734fb9d2876ccde0b')
sha256sums_aarch64=('37d064f6818381d40a680715d1acfccde9252faffc55cd43fb1670571513d81c'
                    'fceb1d3fd59bfc71e2aebf6ae79bdac8e03398529166c93c5191d6395eec2c46')
sha256sums_armv7h=('2e79971023ee803d15056121dc88ec1c39f087a6a2e6058ddcc0379726455f65'
                   'ae36364903b71a9d0a98d505c94e33fb5f094cb3b91d35b33f242bd9fc4abe27')
sha256sums_i686=('f39e98a4b5df9167f9cef4fd5857399dff63f88b2a286c1a9fd4d6a2e6e390b0'
                 'c525b3d7f2443052ae0b0a054c19100e1e629cd37dabd5c44d99f680b096669f')
sha256sums_x86_64=('1d9474c63cf3e6c9785a60a22289f0be807dfba341d11f4c70e9e50858ddc8bc'
                   'c9e0184f479642a6a607b91a59ba24ed39fe9cd3851ba7a8901c32f29fe18fc8')
sha512sums=('4860beb17a170fe9bcf1d4e7ae48fab5ad4f33f9bda5f4b846a26fc913df4726b0f18abecd2f75e641b4f45fb43dfd363e53d2a9a183ca8ac217be09aeed4abd')
sha512sums_aarch64=('0a9f815d5c8fdac93c8670f7005d721c6777ac58b4d377e5dc315d6e398fddceb77cc369581051f141b2d2ce9dbb95dbfb96f129980b16b448c5a298d15c4302'
                    '46d29acf31734f938f4a5fd78fc34cbf1eb4ac8e7ee4386e76c716757636d0c00ea4ee7c24990220d2d5268781c8adc75d688086e97a7366b1a30e5325f8d286')
sha512sums_armv7h=('b26ec3fbe660d40fa765b2132013726257337a02cb8da20fa4216b8e8b336b78b8e549b97d04b02fbc8bfd0f7b833c506cdeed3508b213505af4008037e4ae8c'
                   '1c3c0320739c7d93e4d1ebd35ac2225ded0b3e4023bc6261c57de3c86583bff07a0740cef6922f2459824fa88f93e28654e953efcd34ac39417a6f5f696f8a83')
sha512sums_i686=('bfed8cd83e2c6a13d0763e2c96971d3d084289a1e1a7a2a1d8819cda4c3bf3953bcc8cec12e32a36ff15553bc73d0c32fa2e10f929c3b10a92861113f5c774e0'
                 '6104dd323e0d6244100307b266b6f6b9c414d22a1986d14e3dd9290a94ffe80286bedf3c85f46abf0775d3a23370c660f57946ee747905a3157ed507f0e8db6d')
sha512sums_x86_64=('8527b1f881234e800a8b843675ae9beacd1921af621045d72e06414f17c8cce90a2849f89cb4b98753a0d7c719ee01b1067de2951e2453fe00f116c62240f271'
                   'bb18fefc7728e855bed640d83400fd9d2464a794cc304c0a33337965b5b2b606eb59359ede3960ce4d59b139f078a676206d29591a2185f19f3bead272e24c08')

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
    "${pkgname%-bin}=${pkgver%+g*}"
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
    'dotnet-sdk-8.0' # ?
  )
  provides=(
    "${pkgname%-bin}=${pkgver%+g*}"
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
