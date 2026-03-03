# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="DiscordChatExporter"
_pkgname="discord-chat-exporter-cli"
pkgname="${_pkgname}-bin"
pkgver=2.47
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
sha256sums_aarch64=('936aff4797bfba8ceaee416ac52b6831607e283e58988fe022184a03957a7cd3')
sha256sums_armv7h=('68850dc5d86a5c45511a0e0644c29c14a3ee4e545a22d19b5eefaffe801d6527')
sha256sums_x86_64=('3c886aa6786c19ef3c3f4992fff4a94394bd1c288e7abb4d5ad126be87bc0dc3')

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
