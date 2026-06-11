# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=tdns
_pkgname=tdns
pkgver=0.6.2
pkgrel=1

pkgdesc="A powerful, lightweight CLI to manage Technitium DNS server via HTTP API endpoint"
arch=('x86_64')
url='https://github.com/mbevc1/tdns'
license=('MPL-2.0')
makedepends=('go' 'upx')
conflicts=("${_pkgname}")
source=("git+${url}#tag=v${pkgver}")
sha256sums=('50799e4054e84cc485255360a09e141828dacc9811f30f80932c93ad6e851a12')

build() {
  cd "${srcdir}/${_pkgname}"
  make clean # Explicitly clean the build dir as it doesn't clean properly on rebuilds
  make build
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm 755 tdns -t "${pkgdir}/usr/bin/"
  install -Dm 644 LICENSE -T "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  ./tdns completion bash 2> /dev/null > tdns.bash
  install -Dm 644 tdns.bash -T "${pkgdir}/usr/share/bash-completion/completions/tdns"

  ./tdns completion zsh 2> /dev/null > tdns.zsh
  install -Dm 644 tdns.zsh -T "${pkgdir}/usr/share/zsh/site-functions/_tdns"

  ./tdns completion fish 2> /dev/null > tdns.fish
  install -Dm 644 tdns.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
}

# vim:set ts=2 sw=2 et
