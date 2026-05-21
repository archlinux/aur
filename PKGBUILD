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
pkgver=4.7beta3
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
sha256sums=('6bc47cd09ce0a39f5769a75b63b123971e0414a4d9e83fb94d42d7b8b761e7d4')
sha256sums_aarch64=('8490ca737446d8b768dd0fdfbcef17dd6543d101d6a1b4ddda7ed43b91a7fc7d'
                    '22f2f8ba8f920f0f269aa109e8fed67dd071c1e225f7e627f4f4335b68212551')
sha256sums_armv7h=('31f1db4784c0e5f0b57ab4ab65d01c018208fae9b00885dcbcfca838c8f90c47'
                   '40f28193badc395c5cdc9fcdb02c7f11772563d1e36fb231bc815e1825bc7643')
sha256sums_i686=('a528ddbeff50c72a7adcf79d30e90eacb3809a287800a07517dcf700a8cd9c8f'
                 '9387f3bfbf1902a4aa01ccb0dc54a796db98f274473a623edadb1b4416148029')
sha256sums_x86_64=('40bc29bf68c8b9412225afa4b2b1e6560f41b2fc814686c423744580a18a6dc9'
                   '4e817845f6db61abf3dd9c28a9d9c83a1dadd68653076451dc78833333ba395f')
sha512sums=('1d1dedf3eb3728f2c9a97817dabafccd941f9a2c9c63a6e5d5931e816c8d8212f52ffffc12022454e78d4597ce794d696831aa975303c29e423c379c0d6e3557')
sha512sums_aarch64=('96a68a36d35c4aa319ec048480437a4399257c8611369f131eec549fc70bb34317911d979df278137bac8c5a9c7a187d5d8f4f3cc8e778c605e307febae28feb'
                    '7310ad30c3d74773934c17096be44a328d414d9ed79e9e49474b25ee59d2e60e1459e4bd50b99b258798a1fee2d46a5f47010e1cd9b4459a23b9abb6d70506e4')
sha512sums_armv7h=('c1b34a358d117d5b359b2094604e95ed5ece42a72ce4234548b4af0c0ee2a3bbcbd90052fd59e12ef24b895a0952d7cda78ed980e4d6b5a73b379426828bed61'
                   'f57447bd43e83499afde2780a68a649a9ea96810f1c6aab8ce8ad0e12c3914666a4efcc5a5d8108c9d513d8b5f39ff9fcd86558444a546db3204ad5a8e88a66d')
sha512sums_i686=('475f9691f9c2d2f2e34fb4a2bb69c8d210fefce937f6a5219b911e829b572961ddb967af4b98b7b9de6a6cfe7632e4ffac2013560266f1700e677c2013ca4ef7'
                 '26b765d780bb0e6bfd0a76ce7f7d36b81793eeebb7f06e6f147743a709bc878ce419e018ae6f83af24e4a09767b7464def2f1afa4f97633a28d0c5964ad37d92')
sha512sums_x86_64=('a699c8be968d3e2a56a7be60ec35be1ddf8440c74f0dffa22c969cc4b063a26f3669af3733c410aa4722062470e95d76ed61957daa99922a5628d0f2b368ec64'
                   '728604a7536e01eb8825335169e35e916ecde22a245401b98315e1232c632b4c2902ea620b05c44748a23a16a9d93f89cf29823383289f96c9317daf9e3b8513')

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
