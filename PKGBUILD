# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=kyma
pkgver=2.9.1
pkgrel=1
pkgdesc='Provides a set of commands you can use to install, manage, and test Kyma.'
arch=('x86_64')
url='https://github.com/kyma-project/cli'
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kyma-project/cli/archive/$pkgver.tar.gz")
sha256sums=('2c0a036928f611b6053119cf9a845f40226156033aa893058eac98223c59abc9')

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
