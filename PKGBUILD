# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=qwen-code
pkgname=${_pkgname}-bin
_name=qwen
pkgver=0.14.0
pkgrel=1
pkgdesc="Open-source AI agent based on Gemini CLI by QwenLM"
arch=('any')
url="https://github.com/QwenLM/${_pkgname}"
license=('Apache-2.0')
depends=('nodejs' 'ripgrep')
optdepends=('xdg-utils: open links and launch browser integration')
provides=("$_pkgname" "${_name}")
conflicts=("$_pkgname" "${_name}")
source=("${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/@qwen-code/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
        "system-defaults.json")
sha256sums=('ceb11ad9e184e905c0d89f28ba75423d45c3e8fd14181ba99d73a56f11cb7638'
            '729be4baa7cd839aa383910df26d15111d2af1e4c5415f5bb01ff949881fe8cb')

package() {
  local appdir="${pkgdir}/usr/lib/${_pkgname}"
  install -d "${appdir}" "${pkgdir}/usr/bin"

  cp -a "${srcdir}/package/." "${appdir}/"
  rm -rf "${appdir}/vendor/ripgrep"
  chmod 755 "${appdir}/cli.js"
  ln -s "../lib/${_pkgname}/cli.js" "${pkgdir}/usr/bin/${_name}"

  rm -f "${appdir}/LICENSE"
  rm -f "${appdir}/README.md"
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/package/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "system-defaults.json" "${pkgdir}/etc/qwen-code/system-defaults.json"
}
