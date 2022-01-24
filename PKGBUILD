# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=kyma
pkgver=2.0.2
pkgrel=2
pkgdesc='Provides a set of commands you can use to install, manage, and test Kyma.'
arch=('x86_64')
url='https://github.com/kyma-project/cli'
license=('Apache')
makedepends=('go'
             'git')
source=("git+$url#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd cli
  export VERSION=$pkgver
  make build-linux
}

package() {
  install -Dm 755 "cli/bin/kyma-linux" "${pkgdir}/usr/bin/kyma"

  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kyma" completion bash > "${pkgdir}/usr/share/bash-completion/completions/kyma"
  "${pkgdir}/usr/bin/kyma" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_kyma"
}
