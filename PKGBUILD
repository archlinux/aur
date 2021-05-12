# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=cue-bin
pkgver=0.4.0_beta.1
_pkgver="0.4.0-beta.1"
pkgrel=2
pkgdesc="Validate and define text-based and dynamic configuration"
url="https://github.com/cuelang/cue"
arch=(x86_64)
license=(Apache)
provides=(cue)
conflicts=(cuelang-bin cuelang-cue-git)
source=("https://github.com/cuelang/cue/releases/download/v${_pkgver}/cue_v${_pkgver}_linux_amd64.tar.gz")
# add dummy entries for `make generate-checksums` to create SHA256 instead of MD5 check sums
sha256sums=("187bddf61b87f14c735e2404a5f3fa08dba949457e17104bf248b1d1a7e267dd")

package() {
  cd ${srcdir}
  install -Dm755 cue ${pkgdir}/usr/bin/cue
  install -d ${pkgdir}/usr/share/doc/cue
  cp -r doc/* ${pkgdir}/usr/share/doc/cue
  zsh_completion_dir=${pkgdir}/usr/share/zsh/site-functions
  mkdir -p ${zsh_completion_dir}
  ./cue completion zsh > ${zsh_completion_dir}/_cue
  bash_completion_dir=${pkgdir}/usr/share/bash-completion/completions
  mkdir -p ${bash_completion_dir}
  ./cue completion bash > ${bash_completion_dir}/_cue
}
