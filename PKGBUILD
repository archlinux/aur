# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="DiscordChatExporter"
_pkgname="discord-chat-exporter-cli"
pkgname="${_pkgname}-bin"
pkgver=2.46.1
pkgrel=1
pkgdesc="Exports Discord chat logs to a file - CLI"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://github.com/Tyrrrz/${_Name}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
options=(
  '!strip'
  '!debug'
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver}/Readme.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/${pkgver}/License.txt"
)
source_aarch64=(
  "${_pkgsrc}-aarch64.zip::${url}/releases/download/${pkgver}/${_Name}.Cli.linux-arm64.zip"
)
source_armv7h=(
  "${_pkgsrc}-armv7h.zip::${url}/releases/download/${pkgver}/${_Name}.Cli.linux-arm.zip"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.zip::${url}/releases/download/${pkgver}/${_Name}.Cli.linux-x64.zip"
)
noextract=(
  "${source_aarch64[@]%%::*}"
  "${source_armv7h[@]%%::*}"
  "${source_x86_64[@]%%::*}"
)
sha256sums=('f09a6c8baee695e8d1db784fc89ce1bbcfd68d58e5b623bc0577b0bebc48d86e'
            '16effc795aac6a9ad3143bb679c5d93e41f99fc2a0796e91362d4e09b529da79')
sha256sums_aarch64=('4648e1547c866f48288f3c610035ca0225969e1345e2114081e8ab95fcf4bbde')
sha256sums_armv7h=('94ec8a6f742bb2962cdfcd523d8be0d8deb4a3b37cdc50022084c6af58bb710e')
sha256sums_x86_64=('5732685fff0e4dafd1487eba57695a984be9630688fac2b902d053d165796615')

prepare() {
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.zip" -C "${srcdir}/${_pkgsrc}-${CARCH}"
}

package() {
  cd "${srcdir}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${_pkgname}"
  cp -vaT --no-preserve=ownership "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/lib/${_pkgname}"
  ln -vsf "/usr/lib/${_pkgname}/${_Name}.Cli" "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
