# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Nova Bürky <novadragon.space>
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
pkgver=4.8rc1
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
sha256sums=('ce2bff7305813b9f0b5d6509a24b8753166f5fdd9f467a2e17f9bebbbcdf7699')
sha256sums_aarch64=('789ac295929a80904f401bfe81956374febddd37e27047ed4b8aa3b86f332082'
                    '8ca9252bc20e363476d38d649578da22a7a784023b28aa62ee550be4f7a5f351')
sha256sums_armv7h=('1708554707a7d555b65eb54c3689d4506f9afa81d1fa7a669fd4f14e21766cce'
                   '786aef8b4c0a9b1587ea9301301af79b27ee725ecb1bde381906d667dc60b6a9')
sha256sums_i686=('31ea3ad46f9d5bdeeb726f7f67946dbe954c7b44f8205f9f7fddd46ecbb14a68'
                 'e3c3525272d61a0f0fcbb9015cb60af9ef5f60a56fb74df0a8e0a4afed80ca59')
sha256sums_x86_64=('6c388a62dc899d1cf37334fd28733d4277aeea99d71918b9a5810af50cd38eba'
                   'fa6b3e56cc25e39870bdd63a49767d8c8dd0c1be09ccb7ad3218ac8c2279c13c')
sha512sums=('29e491a906a58913cd21ce5abde78e54e11a14043073e6213a415debecf9bf7d790bc44f90daec404319efd0c6cd4f856bbf3487cdb9263833967f4e0d36bf8f')
sha512sums_aarch64=('e3fc43fc0c91bd6e6c84b36bcc6d1a44e748ccc427a67c98382e4a622f71a33671a933c5cf7a6279eda822c449ee084be391acb8b766b52ff42e7c0dc6d6400d'
                    '661011432f4a0ab0e9cc82e26efc8c0ab966502e0e91dca9e249ea1199a31e46e4dbdd68569740a5bab933000a6af870a38e20dfd3b2f7554412da59730a2c25')
sha512sums_armv7h=('bd47685445b6e5f4ba286aa156a7409796ae74340e6b45b30f9d72e2ebc5539a2c339d40976fd783f85da22e907a28f0323076539f5cf6c3fffeb681a1dbd5e9'
                   '0a40fd755fbbb7b2b530ff4388a1b408dc6a79aa985b9878d9a01b03386d2b9754fc80350b5b447a2f144394408e2fff97f701b29e44ce6c70ddc2f1b9fa0df9')
sha512sums_i686=('e918caec2cfaead450b3876384a3e2b408fa01e60a48d2d2c3174a7439040b5e2f42faf25734acd941165536aff18675d5329f4cd817c78eb66cdfe1eaed62b4'
                 'a9f752021a9c4b0accefe6b4b78faf39994b67629d97974827e0686c7305f79172f5045c6bd9718cf99e1888ee51aa244bec8be6806fb300580f4e54adf77001')
sha512sums_x86_64=('474c3e41c53a1f4a77960c6cba8a0297f7ea0fb8090f392aabf5c38221eba085b078dc5a063702117bacd32ec98a702833c958e0952801b9124c075ce4e61ce6'
                   '2535ea08035c72a3f93638717c20ea94d44a8619dcf4370afb9e821c5f5bb7985349285b8a7faf6db942a4bf2f689e5e98777e69144afa2a11ff1ea83aac3bc7')

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

  cd "${srcdir}/${_pkgsrc}/misc/logo"
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

  cd "${srcdir}/${_pkgsrc}/misc/logo"
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
