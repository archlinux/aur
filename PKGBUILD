# Maintainer: sk8thing <sk8thing[at]tuta[dot]com>

pkgname=arch-skm-bin
_pkgname=arch-skm
pkgver=0.2.1
pkgrel=1
pkgdesc="Automated linux kernel building with Signed Kernel Modules (in-tree & out-of-tree) (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/sk8thing/${_pkgname}"
license=('GPL-3.0-only')
depends=('git' 'rsync')
optdepends=('base-devel: required to build kernels with makepkg')
conflicts=('arch-skm')
options=('!strip')

_arch="linux_amd64"
_archive="${_pkgname}_${_arch}.tar.gz"
source=("${_archive}::${url}/releases/download/v${pkgver}/${_archive}")
sha256sums=('47f1e73ff3af9bb74fa0e7c3fb4b7250a506a870c24ee1e5412f26d3098ce75f')

package() {
  cd "${srcdir}/${_archive%.tar.gz}"

  install -Dm755 skmctl "${pkgdir}/usr/bin/skmctl"
  install -Dm755 skm "${pkgdir}/usr/lib/skm/skm"

  install -Dm644 completions/skmctl "${pkgdir}/usr/share/bash-completion/completions/skmctl"
  install -Dm644 completions/_skmctl "${pkgdir}/usr/share/zsh/site-functions/_skmctl"
  install -Dm644 completions/skmctl.fish "${pkgdir}/usr/share/fish/vendor_completions.d/skmctl.fish"
}
