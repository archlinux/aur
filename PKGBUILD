# Maintainer: Joern Griepenburg <joegriepen at gmail dot com>

pkgname=kyma-bin
pkgver=2.0.2
pkgrel=1
pkgdesc='Provides a set of commands you can use to install, manage, and test Kyma.'
arch=('x86_64')
url="https://github.com/kyma-project/cli"
license=('Apache')
provides=('kyma' 'kyma-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/kyma_Linux_${arch}.tar.gz")
sha256sums=('4c203bf0157d4283b254162d175d31601b949d4ea673f649e6b77f13e738eaec')

package() {
  install -Dm755 "${srcdir}"/kyma "${pkgdir}/usr/bin/kyma"

  # Populate bash and zsh completions
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kyma" completion bash > "${pkgdir}/usr/share/bash-completion/completions/kyma"
  "${pkgdir}/usr/bin/kyma" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_kyma"
}
