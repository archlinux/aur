# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=kops
pkgver=1.22.3
pkgrel=1
pkgdesc='Kubernetes Operations - Production Grade K8s Installation, Upgrades, and Management (build from src)'
arch=('x86_64')
url='https://github.com/kubernetes/kops'
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubernetes/kops/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('76fb2e20f1d4d54904311c3aec2298ae99dcea5ea8473677a61f6e6c7418d341')
makedepends=('go')

build() {
  cd $pkgname-$pkgver
  export VERSION=$pkgver
  make kops
}

package() {
  install -Dm 755 "${srcdir}/$pkgname-$pkgver/.build/local/kops" "${pkgdir}/usr/bin/kops"

  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kops" completion bash > "${pkgdir}/usr/share/bash-completion/completions/kops"
  "${pkgdir}/usr/bin/kops" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_kops"
}
