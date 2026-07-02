# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=qwen-code
pkgname=${_pkgname}-bin
_name=qwen
pkgver=0.19.5
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
b2sums=('8337e4bd282e977649fbaee47d5e2ec240d8ce65451c3433c4c1bf061081ebe70898eab9dbf5650e4d70abc33909972eda3351b5337baf7c580848b9a9219047'
        '30c86151e58bd11bd1d39238646aae2dd8bc743ca2a03b64371a9dc36eae81c3acade6f39fe0235b0e7f8b059c7181d04ae5d134a3a316e0f9b3815b8f197bee')

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
