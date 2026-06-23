# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=qwen-code
pkgname=${_pkgname}-bin
_name=qwen
pkgver=0.19.1
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
b2sums=('e71ca939304021dcbb4b27fb47edf3e0b7031b42932d65854020d2643ecb81e7d09d21e50fe65acae49e410f92005c3eba0fef14716e972c5bc73a67ce838f60'
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
