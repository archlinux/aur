# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=kyma
pkgver=1.13.0
pkgrel=1
pkgdesc='Command line tool for working with Kyma'
arch=('x86_64')
url='https://github.com/kyma-project/cli'
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kyma-project/cli/archive/$pkgver.tar.gz")
sha256sums=('be08a2e92be7fac6e972107e0b8102cfae22448424642691c8340476283915cb')

build() {
  cd cli-$pkgver
  export VERSION=$pkgver
  make build
}

package() {
  install -Dm 755 "${srcdir}/cli-$pkgver/bin/kyma-linux" "${pkgdir}/usr/bin/kyma"

  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kyma" completion bash > "${pkgdir}/usr/share/bash-completion/completions/kyma"
  "${pkgdir}/usr/bin/kyma" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_kyma"
}
