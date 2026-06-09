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
pkgver=4.7rc1
# 1. replace text with -text
# 2. add -stable if not present
_pkgver="$(printf '%s\n' "${pkgver}" | sed -E 's/^([0-9.]*)([a-z].*)$/\1-\2/; /-/!s/$/-stable/')"
pkgrel=2
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
sha256sums=('11efd6544783025511646d5508e025cc0052273fb7bf6c37809f4127b44beea6')
sha256sums_aarch64=('b591534d023d4e13e5c464580ec650e1805e90fe3cbcff2a6581db373a3078f7'
                    'd49fe59b09090e0564d996b358c1ac335d543298527f6313814470bd19ead990')
sha256sums_armv7h=('56a2af11d0e6c7a39ae5140b005cec7384fb257efb13d24126171418cbc38b2a'
                   '6467421cfb41732f097da64782d47204b6d444adb77847d07c0d48e1bee206a7')
sha256sums_i686=('3669ce56c055d2f12e4472ce14e1b5f8e37365f0a515dc2b0408bac2791ee70d'
                 'fe3da954fd67b31abfe92d5fcc6d84b64660f0709b531858f7911d0036d23926')
sha256sums_x86_64=('f13e7a224d925d94b5a3553bcfd69cf5e4c93b67c6b185724834065d1c695946'
                   '608e27a0911e41e14c12354bf236dde3da0a807fe257d4c33a135145b472f847')
sha512sums=('3f9b6babe3d8e431151acccb185b882556fd4eaba326467a0b2c3efa4dd1d39b069d7e3bebc16f8f69ae0328f1b3ca65e46510b0a9d1b96f24cf29ab52870411')
sha512sums_aarch64=('4fc965726548a885eced17eb2a7a75e14f0e5c974f885568bc93aeaea1b0617663f3a52a0794c8a232663a136ee807d9ef2bcaa3c574effa645eb93de73091e1'
                    '8038d1d96f9e82a6d69365c689274fa3503b43720d0cc8a7aea2d1ef8d15ee131bc4a0f65c3b1d26dd63afd82e1a82032e6b5bf9e69756a598c768c2944cd316')
sha512sums_armv7h=('ed49535fc303537114446e11d9461fd93c8c954c6badbb9f88039ad2cb3a46be8849eff3ae66ab62d70e203bb50f0ea0224f74645ad252d1b81ed9257dae358d'
                   '36e9266b0a0131e158c90faed77f4239d1dbbd95c3bf37cb239c1aa554adfaf0e5413e7050ec5b7d9b0918cad726e1ce994e16a66cc2d63d75c9b1a1663e2a64')
sha512sums_i686=('2ed219e66994e19b3b76fac1264a01eca647a0c19153cf039661c6f49b018ffe9d4d85908d51eea7084d0d4214b1973825739eb0a7fb16de18623e8b9aa8465e'
                 '3cf371cf135730ffccc222ccaca4e20bc56d2845bc4602d31a621b4babe8ee370a9f7453bbe423187f52752124874f8a91854d76eebacae2905c2bd9ee574d45')
sha512sums_x86_64=('f4102ca64f5aa693ba87db6128313c22e2ef0e25adf0e486190bad7a5285d5a1877ef53511d159c9fc08015c9e9d18fef12ae6e0e332bd1c0ac45243a8cf7537'
                   '97a3ed0818b7b44c87c6e2c6ae2122b124ac8ea4ae201b32ea0cdfe9130bd2f78911f7095a2e67cc3fc0cd82267ae8898ac644a96fee5e5c949d65d2ab09cb1d')

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
