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
pkgver=4.8alpha6
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
sha256sums=('17f4401b027d51220658c6fbaf9cc17dad0c0b379563fc9b82bd81b9aab7e750')
sha256sums_aarch64=('f4c9d3bb9744a3409d5357020c5a2b466faf96fcc44bccb503cd52ddb9d6af87'
                    '65317755d6ba45d9889cb2527b61294c3f6fcde1e8d27cdfbec274b712b6667a')
sha256sums_armv7h=('8a47b3d65b55b95c06022109f775902e52e1ac916569ef210ba8dd4d3c35a293'
                   '81a8309232f7412c0d6bfcdc73069175f2a42aa3e8d1e83326420d59d71712bd')
sha256sums_i686=('dcfdbdd023127da6749f5ce86786f2c3ae2fbfba1c59aa43f7fbb5d670bfd2f7'
                 '2cd54155f6f1c402952895bebe9ea49b2b02d3dff3b2580c787853fc76e302e7')
sha256sums_x86_64=('d3678019d0a6501d754db36807110a02a1cfa24d49886be8d3a72d91faa80ca3'
                   '1658eeb19c04b76c723def84ded44c28f80985f40bebcc36994a1b8b1bde9799')
sha512sums=('ab58e4379447cb37f853a64de75599ad80651fb6a26465ae23a6b1eb3c902604c9914debf39bb0a5d750e695ec5bb9cbce4e8c10208a76c13aacc6f9eaeb0b0e')
sha512sums_aarch64=('8362c6dd3a605f88d28f9d8368123c71613a8492a6f6d278438a74d7094216cb14f1bd88ed1c7d3c7cf2d1292a4e3f1778a390dbec006e0cb6f7d02483b5b257'
                    '588db459f6b4d0125ab0b89752c8f2940007a3321b50ccbbfe22b7ddcb7376109ff7bbabe8ee083c0a7d58ba93c9bb3d5208daee9dc891c73b64c2e760add522')
sha512sums_armv7h=('691aaed37f64c578cc2b8edb7d2a84585c61f64bbcdcc5a0b458768a4bc1138dec1e6ae7b024be7cb04cbe02cf2112cb08a86ffff4318a45a221d8029cced33e'
                   'a157b6a66e5e842f48c0084945a3690102a04840ebe25a3905110f169fed36343a0d7b4f21332c13801ba7edf97df6af3fe04c484658d6fdfa9b718858073fef')
sha512sums_i686=('0bd75cd0e4f8ddf17466bb9f55b84b0a5477bde5a68ec994042881f72743f6151a101ccafece47fcd28faf268b5699dc610d276cc09735d08f6bc8014d788836'
                 '4f21f09b2cc195481dc7ee7c2b8d8fb989ed9f284aa6104b762dd1115afc3915f6897df58ce27c88e1c5f3e615aae86a52871c6d532ddb5b79cdaa1bcc8eed37')
sha512sums_x86_64=('8adb1e1fc2936092db8114fd54fd70df30d91c761316d405a13f9eceb3f66d0172bf711e612ecd9aea3ac028142e6b6c4adc75ccdff20b522bc8ec804b0d96ea'
                   '8610ef876cbbeab35c8c3e60353e748792907f01e20fc50b230214e9ac68573426616185763c88ed8cb23ca66b99628c4fc2c513313a31e386add6c7c355a089')

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
