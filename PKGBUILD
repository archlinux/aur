# Maintainer: Joern Griepenburg <joegriepen at gmail dot com>
# Contributer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kyma-bin
pkgver=2.13.2
pkgrel=1
pkgdesc="Provides a set of commands you can use to install, manage, and test Kyma."
url="https://github.com/kyma-project/cli"
arch=('x86_64')
license=('Apache')
provides=("kyma=$pkgver" 'kyma-cli')
conflicts=('kyma')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/kyma_Linux_${arch}.tar.gz")
sha256sums=('d9566d5f9a0f302a1d60d62a6ded3176794bddfcb0360b0fb4b210228b014ada')

package() {
  install -Dm755 "${srcdir}/kyma" "${pkgdir}/usr/bin/kyma"

  # Populate bash and zsh completions
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kyma" completion bash > "${pkgdir}/usr/share/bash-completion/completions/kyma"
  "${pkgdir}/usr/bin/kyma" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_kyma"
}

# vim:set ts=2 sw=2 et:
