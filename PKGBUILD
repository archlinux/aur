# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=kyma
pkgver=2.3.0
pkgrel=1
pkgdesc='Provides a set of commands you can use to install, manage, and test Kyma.'
arch=('x86_64')
url='https://github.com/kyma-project/cli'
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kyma-project/cli/archive/$pkgver.tar.gz")
sha256sums=('a7bf6261fb474b79cad5f6dd2dc9d342310f2daef9038ab52054d6b196e768ab')

build() {
  cd cli-$pkgver
  export VERSION=$pkgver
  make build-linux
}

package() {
  install -Dm 755 "cli-${pkgver}/bin/kyma-linux" "${pkgdir}/usr/bin/kyma"

  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kyma" completion bash > "${pkgdir}/usr/share/bash-completion/completions/kyma"
  "${pkgdir}/usr/bin/kyma" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_kyma"
}
