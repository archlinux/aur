# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=talosctl
pkgver=0.4.1
pkgrel=2
pkgdesc='CLI for Talos - A modern OS for Kubernetes'
arch=('any')
url='https://github.com/talos-systems/talos'
license=('MPL2')
makedepends=('go')
source=("https://github.com/talos-systems/talos/archive/v${pkgver}.tar.gz")
b2sums=('a82246d09596c70287c8b716d9bb0b93ffa6ec5259dce171fa9a75e796f4ffb501fa2873e98c4d88ba36b0ff7491750e1a2a7b0110f910924f006807d0523a46')

build() {
  cd ${pkgname%ctl}-${pkgver}/cmd/talosctl
  go build -trimpath -ldflags "-extldflags ${LDFLAGS}"
  ./talosctl completion bash > bashcompletion
  ./talosctl completion zsh > zshcompletion
}

package() {
  cd ${pkgname%ctl}-${pkgver}/cmd/talosctl
  install -Dm755 talosctl "${pkgdir}"/usr/bin/talosctl
  install -Dm644 bashcompletion "${pkgdir}"/usr/share/bash-completion/completions/talosctl
  install -Dm644 zshcompletion "${pkgdir}"/usr/share/zsh/site-functions/_talosctl
}
