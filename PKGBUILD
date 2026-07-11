# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=qwen-code
pkgname=${_pkgname}-bin
_name=qwen
pkgver=0.19.9
pkgrel=1
pkgdesc="Open-source AI agent based on Gemini CLI by QwenLM"
arch=('any')
url="https://github.com/QwenLM/${_pkgname}"
license=('Apache-2.0')
depends=('nodejs>=20.0.0' 'ripgrep')
optdepends=('xdg-utils: open links and launch browser integration')
provides=("$_pkgname" "${_name}")
conflicts=("$_pkgname" "${_name}")
source=("${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/@qwen-code/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
        "system-defaults.json")
b2sums=('9535375baf5f5b268d9e829ddf1be2ab7772bdc328df529e2c4932b08bef71b30fe1eefebb3a4f2c0e7ab75ef340c3cfa940512b7c650a458256d2269de7e5cf'
        '30c86151e58bd11bd1d39238646aae2dd8bc743ca2a03b64371a9dc36eae81c3acade6f39fe0235b0e7f8b059c7181d04ae5d134a3a316e0f9b3815b8f197bee')

package() {
  local appdir="${pkgdir}/usr/lib/${_pkgname}"
  install -d "${appdir}" "${pkgdir}/usr/bin"

  cp -a "${srcdir}/package/." "${appdir}/"
  rm -rf "${appdir}/vendor/ripgrep"
  chmod 755 "${appdir}/cli-entry.js"
  ln -s "../lib/${_pkgname}/cli-entry.js" "${pkgdir}/usr/bin/${_name}"

  rm -f "${appdir}/LICENSE"
  rm -f "${appdir}/README.md"
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/package/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "system-defaults.json" "${pkgdir}/etc/qwen-code/system-defaults.json"
}
