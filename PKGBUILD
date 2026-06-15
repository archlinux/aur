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
pkgver=4.7rc3
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
sha256sums=('70ba9bf3b57a7ec72611191544d7a51b3548b032d32069e315ab53f4d6891385')
sha256sums_aarch64=('06d598275946f7ae11947f2b3892aebc6fc69bab79aa518ec2dff940f62fd643'
                    'ab30d60cc35c4104b49e0a0e4c48693d82fd6214ca9d936229a55851260ab590')
sha256sums_armv7h=('651db47b63ee4adb38ee79a305ee46c437cd4fbdce904554ec78d513f1cdf1af'
                   '61de8d97d043dddf144f3016a2fa3c4e9911729d5b87b0a0d256e4350f6e8275')
sha256sums_i686=('21691b80d0a714b42165181f576fc378286cacea9d6656ea67893188d03e562b'
                 '208ed209daf12f54bdc37d14e981dcd5ef01b51b9d661a0117329212362269d7')
sha256sums_x86_64=('174ca05ea9189f5274b0f3f9e252607a935bfce8ff593b758d7d11aa3b0479e6'
                   '548910ee93f92b97dbeaf4cb54b0632e4e1c350e59f35494d8085ef22155d26a')
sha512sums=('9084454c47d9f167471137cd0750df3d6e4e825864b3bea3f85c2c0152a9d9c0ee1dc72bf079350bbc6ca9dd2e004391793de9e364f40bc3a8c9afe621b19cd7')
sha512sums_aarch64=('2079cd6d1354eafc8ad22601849a237ea5f6279890ff5d50650f3d755f8ba790141cc700d7cbeeaef36f9f9290f7f2959570cc3a2c321d444d5308324d3f83de'
                    'fab30a84c1cb85322521a46c85628c25c0f2e8fbcb43c9a808ad6fb047e3f6990147376c3a450a4716785c2a12e89e8807781d003b50110d9fd9a86c2cf51c8a')
sha512sums_armv7h=('984f8a706011d0632f45ac5cd79ae33880d153f7a3db3e90051235bf30f65c1d31b9f5572c2fd4ca99b9f708cd7079721fdbe9bd6e23d84b4025a0591e037a40'
                   '22756d511392c28d73bb94bc86eefa3a04d0560f37fece7c4e3b1279f2e5fe19666dbc91af7c8bc5d22ef89412ef85256daa2b909db3fdb9a0677d589947737b')
sha512sums_i686=('a18241417fc41d31e31671c35f7f35d5a57f23db1b1e4c1b8321b080ba277ecb8dd26166d12a16c06fe1753b120945cfe2262f7e7e06d3cbe1208f0df1232d1b'
                 '3007faa3b72298ee800324cce657c39c8af178bed7fdc4ddb209c39d6995fa31099ad5c67abfd9ad4033f24fc99aaa0b9ac580325f43fb74e82bbd10053454c4')
sha512sums_x86_64=('807d9f0e575a0f23897fa97ecc824002bd7339347771f6a92a4b306b662fe25c0c88a768c16ea9cdbc764ca17fa79c77e34a04943fbb5f67b10a02a11576a639'
                   'bdc696f3bb6fd5ebaaadae7cc7bfa6a1be2e6743df94b455761833e8dfe6772de08dd7b2c05cd969d6c9b135cc50271fd8da3f34e41c0dc1e629a26f579020cf')

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
