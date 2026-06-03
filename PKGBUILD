_pkgbase="godot-beta"
_pkgname=(
  "${_pkgbase}"
  "${_pkgbase/godot/godot-mono}"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=4.7beta5
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
sha256sums=('a83310d8d378287636abdb6946af7707811f01ceb1aeb49cf565d2111feb638f')
sha256sums_aarch64=('af82ee629049e61442392320824a86dc23a3ab22e7bf191f489fe75df97379c9'
                    'a72f38fe36df6d199f7924cef5a2ee7ed12f3e39a803b779dde5efc41940f070')
sha256sums_armv7h=('a5a8ea54df82cdddd8c9f0301d9fc38d6ee4251551f3b7f14c8298dd64c1fe3f'
                   'e9c9e780b17f832e56564d510e961703d04d5ed090631ac07c3670ed58c6cf72')
sha256sums_i686=('b23b13551c9766143e96cc62d719f54d856bdfd906414655f8c828b89fcfd023'
                 'f65eac1a14802d82ce9b13c0f3edbbd96a30bf2a13d0adad9b8601bf1aeec34b')
sha256sums_x86_64=('a954dcf90320bd627229c656652e96641bbeb98e190ab3653f18617dcfc75a58'
                   'be0aade691ce50dc1792599474a536bdb33407fe1670cf53c13e2f872c0ac82f')
sha512sums=('36a8f4821408c864f14c484f68f1ef9b9d80b9881916def86a2aae0d824c7ac6fd105e6c76b0d942837d71ed9ab088b5ff8ecebff5d82d0b2c912a111dfe7cf0')
sha512sums_aarch64=('81d3d531cd526b8baecfb8fc474c2089e737f2a3710d957970d9e895d0264427f4b65dd73b7128f95ed5a85610525340cffe5d729f2a27a87691c591e9b76666'
                    '154f89d14b962b269299c322b70381a905f3b4a32097470b9c4541c5b50db9d1ba8318443d7cec3615d214515a9b3fe7fd8b88a980c19927559e9313b33ea8c0')
sha512sums_armv7h=('e3d1e43623f3a01b8ceb89773eb6371f325e36c214ba94f6c0bf45c046204688ffcc8b17944632eb0295ae329c049d9b04f36e76c9a7a43c81d497d0eb6e6637'
                   'f8d5d844dc1683ce5e36fd1c50030704404816ea0959dadcd414b3657ee45a18bec15c62d1b9d4903af2161bac7979b428719b6bb3a552ede904ce08294398af')
sha512sums_i686=('29447441e364800ca8a2dce120f804504c5d9aa2d6edbcfebb0d702f9e5db3d288ea73b569bb40416411544743af184df1749530c6f6b01a44be301dceffcd13'
                 'a617f3760bda653a536006f69e1ab51140dfb7c4aa77d335e8dd2099ef4c9655f61b12a45e4203345ac950032e221299a4df96db2113136c0d32fa4b8dcb27a3')
sha512sums_x86_64=('26dc94899ff1b2e994b817914e64d6085bae70aca56fef09e6c85879331ac4e463caebfab4a12926149cb211b6bf60b4a76964c8fce6d5396695232ecfd4afad'
                   '1cd7e28436198b9c62f5236097ac2cff91e43255e7a31189519059feca5a3ab7f15ea8578ae98e17b295bf23cfdece85ab206bd03b8aad07d3df2dccd0162043')

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
