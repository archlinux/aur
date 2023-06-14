# Maintainer: Joern Griepenburg <joegriepen at gmail dot com>
# Contributer: Arturo Penen <apenen@gmail.com>

pkgname=kyma
pkgver=2.15.0
pkgrel=1
pkgdesc='Provides a set of commands you can use to install, manage, and test Kyma.'
url='https://github.com/kyma-project/cli'
arch=('x86_64')
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('73f79057971e74be369bfc6bb7ede3663e6b40ada4463c7d8878e64ceadfc85a')

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

# vim: ft=sh ts=2 sw=2 et
