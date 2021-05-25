# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=cue-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Validate and define text-based and dynamic configuration"
url="https://github.com/cuelang/cue"
arch=(x86_64)
license=(Apache)
provides=(cue)
conflicts=(cuelang-bin cuelang-cue-git)
source=("https://github.com/cuelang/cue/releases/download/v${pkgver}/cue_v${pkgver}_linux_amd64.tar.gz")
# add dummy entries for `make generate-checksums` to create SHA256 instead of MD5 check sums
sha256sums=("a118177d9c605b4fc1a61c15a90fddf57a661136c868dbcaa9d2406c95897949")

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
