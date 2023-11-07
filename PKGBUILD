# Maintainer: Joern Griepenburg <joegriepen at gmail dot com>
# Contributer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kyma-bin
pkgver=2.19.3
pkgrel=1
pkgdesc="Provides a set of commands you can use to install, manage, and test Kyma."
url="https://github.com/kyma-project/cli"
arch=('x86_64')
license=('Apache')
provides=("kyma=$pkgver" 'kyma-cli')
conflicts=('kyma')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/kyma_Linux_${arch}.tar.gz")
sha256sums=('125aa3e7f366d55377f1e652ce214053bda5b00adfe0e97b4de3d85a3386849d')

package() {
  install -Dm755 "${srcdir}/kyma" "${pkgdir}/usr/bin/kyma"

  # Populate bash and zsh completions
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kyma" completion bash > "${pkgdir}/usr/share/bash-completion/completions/kyma"
  "${pkgdir}/usr/bin/kyma" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_kyma"
}

# vim: ft=sh ts=2 sw=2 et
