# Maintainer: Agil Mammadov <mammadovagil@proton.me>
# Contributor: Daniel Fichtinger <daniel@ficd.ca>

_pkgname=iwe
pkgname="${_pkgname}-bin"
pkgver=0.26.0
pkgrel=1
pkgdesc="Markdown knowledge graph – CLI, LSP and MCP servers for notes"
arch=('x86_64' 'aarch64')
url="https://github.com/iwe-org/${_pkgname}"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
options=('!debug')
provides=("iwe=${pkgver}" "iwes=${pkgver}" "iwec=${pkgver}")
conflicts=('iwe' 'iwes' 'iwec')
source=("LICENSE-APACHE::https://raw.githubusercontent.com/iwe-org/${_pkgname}/iwe-v${pkgver}/LICENSE-APACHE")
source_x86_64=("https://github.com/iwe-org/${_pkgname}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/iwe-org/${_pkgname}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('cbf05ab61c79f63823ae7ce980ed10d70408a754f2a02982f615f09b3d5e3ebd')
sha256sums_x86_64=('40614a5b771e60d22edd668794e341bac7e52f396a4744ab1acd6bc12ad6af9d')
sha256sums_aarch64=('71a9eb03554fceda18c2309119d5abb76d07e29811ddf647c1a2a2447f9c72a0')

package() {
  install -Dm755 "${srcdir}/iwe" -t "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/iwes" -t "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/iwec" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  "${srcdir}/iwe" completions bash > iwe.bash
  "${srcdir}/iwe" completions zsh > _iwe
  "${srcdir}/iwe" completions fish > iwe.fish
  install -Dm644 iwe.bash "${pkgdir}/usr/share/bash-completion/completions/iwe"
  install -Dm644 _iwe "${pkgdir}/usr/share/zsh/site-functions/_iwe"
  install -Dm644 iwe.fish "${pkgdir}/usr/share/fish/vendor_completions.d/iwe.fish"
}
