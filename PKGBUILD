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
pkgver=4.8alpha3
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
sha256sums=('0d54f9ea425719526c334239535bd22f6d57a8db1152f0d2e2715c909b5ef88d')
sha256sums_aarch64=('1dc0100ed918fabb3c6dc7a581a241d9838255095d2baeb30375c99547004792'
                    'b77c406412e4fca2d04c19fcd69e3cba0e2fb6e2d231ce7715b1293229f5bed6')
sha256sums_armv7h=('35b230ab92abb12653c228321b7bd7a4aeb93a4731b76f1c7ff9464165198bc8'
                   '8158d4994379562845589eee18a8263d27c3d8ad691ce5337caca5e8197d154c')
sha256sums_i686=('3f101fe84dd83f6f12412dcbffdb3437161f050987bc1ec8cec3e9b468f4ecc8'
                 '16921d2c9e6fd712e0dea0052a45735e71e294ae2b10a165b77ebcba284d4643')
sha256sums_x86_64=('94132a78e623f08243dbf809e3c3f0c5f551c1d4fd92261426e551e3a2e8ec5e'
                   '9661bb12399278b5626ef832c228b4d22fc3929aeac1569029c6bb6b8a2f5c85')
sha512sums=('2d9efbebe3b0e39f44b225dd999bdf5d79b58d244445c797304ff02cf9573fe49599d8aff350fe14fb6b25d8d26e09a20e198521edf09a057002aaa3810392ab')
sha512sums_aarch64=('22734d0072caba191dccece15d440dd5cc173cb4d97eba82b0a3281764ad0d99584510c93fe3e83c9be50792d3f339ed8995a8567c42a9abf07d871e3e0e74aa'
                    '361beabfe41fa9a94a12de2050bf59e9c789b59dcd8853d6fe2abd56e9e17672fe3a7c97e9daaa88ef03b4492251ba7fa8c7de6da4cb1382a61efda7f8ab50d7')
sha512sums_armv7h=('ea17e097add78f2afeeb390e911d557a8b85aba94984c462c8e1bafb7296f529ce84e408ded6bc469ff993e22b7aed5c0e9c7c10d7e9ee7d6df6b455d2a0d878'
                   '87c4fc6ce808fb188964ccad4742881d010e8a75315e358fdd524ab9eaad91ae2636c078e39605d79e6f11cce0d852908f5ab9d9694719f1ac6527ed50d5d262')
sha512sums_i686=('59c24d58688736c6adb96c2e980f73203e3ac1f7af2a3c306ea133bb6ab0c5a1df2bb55984fbfc59b577ce3953ec1f4cef0286dea97e8cdf93cf7cf4eae657d6'
                 'f4c0d7b4f5953fb0acba8302c7ba7ee7e1fc31513f3034f1628ca171340cf8b08303cec6325db15c7e81b215d9cf253136332f9c44267785c83761bce55ee5a7')
sha512sums_x86_64=('4007e214b70a5c190c14469851b793ce712236fe6d2d31f83577498187c5b461455b591357751e7b5c05d9b7999ddc88163e60b3c411c812aba70f8f1cee33bf'
                   'f3832bc6fbe16522825038bb6b5ee9194d017fadceca8243006ef507637a1eab395be909aebd23783ff217f1a6166f90a4ecbda63f2e72b21b8c37a08ade9e82')

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
