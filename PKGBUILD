# Maintainer: robertfoster
pkgname=ceasta-bin
_pkgname="${pkgname%-bin}"
pkgver=0.12.0 # renovate: datasource=github-releases depName=ngwg/ceasta
pkgrel=1
pkgdesc="Disassembler, decompiler and ptrace debugger with a built-in MCP server (CLI)"
arch=('x86_64')
url="https://github.com/ngwg/ceasta"
# ceasta itself; vendored lua (MIT) and capstone (BSD-3-Clause) are linked in
license=('GPL-3.0-only' 'MIT' 'BSD-3-Clause')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${_pkgname}" "${_pkgname}-cli")
conflicts=("${_pkgname}" "${_pkgname}-cli" "${_pkgname}-git")
source=("${url}/releases/download/v${pkgver}/${_pkgname}-cli-${pkgver}-linux-x64.tar.gz")
sha256sums=('07dba43d3004f8af69f087127657d888862336cad6ca5afca6b826e1bdea5757')

package() {
  cd "${_pkgname}-cli-${pkgver}-linux-x64"

  install -Dm755 -t "${pkgdir}/usr/bin" ceasta-cli

  # example lua scripts for `ceasta-cli run`; the cli does not autoload them
  install -Dm644 -t "${pkgdir}/usr/share/${_pkgname}/plugins" plugins/*

  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" README.md CHANGELOG.md
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE THIRD_PARTY_NOTICES.md
}
