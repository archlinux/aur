# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="DiscordChatExporter"
_pkgname="discord-chat-exporter-cli"
pkgname="${_pkgname}-bin"
pkgver=2.46
pkgrel=1
pkgdesc="Exports Discord chat logs to a file - CLI"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/Tyrrrz/${_Name}"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug' 'staticlibs')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver}/Readme.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/${pkgver}/License.txt")
source_aarch64=("${_pkgsrc}-aarch64.zip::${url}/releases/download/${pkgver}/${_Name}.Cli.linux-arm64.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${url}/releases/download/${pkgver}/${_Name}.Cli.linux-arm.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/${pkgver}/${_Name}.Cli.linux-x64.zip")
noextract=("${source_aarch64[@]%%::*}"
           "${source_armv7h[@]%%::*}"
           "${source_x86_64[@]%%::*}")
sha256sums=('b1b0d248e91b70e6d539800fd105d345809c88f8e0e5577de1547ae91c2afb02'
            '19baa8181e419519c7889d6b2c733844268a2d2bda341d82987d6f709ee35b8f')
sha256sums_aarch64=('c187f6d0cf7be4bed6f6445b3fbd95555824bf02c250ebf2cf280841544bb4d7')
sha256sums_armv7h=('22d2092ef789734d202081c1ab8c7a5da21e551b10fb5c6db9b5bd19e53efef8')
sha256sums_x86_64=('ba5a5ea60f706a784b7985269005ed0e32580b586ca7fdba1ae1412cc8113cb7')

prepare() {
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.zip" -C "${srcdir}/${_pkgsrc}-${CARCH}"
}

package() {
  cd "${srcdir}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${_pkgname}"
  cp -vaP "${_pkgsrc}-${CARCH}"/* "${pkgdir}/usr/lib/${_pkgname}/"
  ln -vsf "/usr/lib/${_pkgname}/${_Name}.Cli" "${pkgdir}/usr/bin/${_pkgname}"
}
