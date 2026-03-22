# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="DiscordChatExporter"
_pkgname="discord-chat-exporter-cli"
pkgname="${_pkgname}-bin"
pkgver=2.47.1
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
sha256sums=('cd90fa50aa68b24bd9c6dbadab2ddd68c1fd69a3faca51e433dacc92e40de459'
            '16effc795aac6a9ad3143bb679c5d93e41f99fc2a0796e91362d4e09b529da79')
sha256sums_aarch64=('13d2d03485d299ab8fa16272ee77be0911f533231f5ee9169dba6c53e602694e')
sha256sums_armv7h=('257d53a3dbecb936ba191117d1a5f2399df40e5ae0b4c5751b068497f8faaf9c')
sha256sums_x86_64=('2ed48fbb23ae9836ecd3780857b57cf5c7a9b5e3b07c13c3c606e9147e76ce69')

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
