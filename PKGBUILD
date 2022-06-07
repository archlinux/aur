# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=rancher-k3d
_pkgname=k3d
pkgver=5.4.2
pkgrel=2
pkgdesc='k3s is the lightweight Kubernetes distribution by Rancher'
arch=('x86_64')
url='https://github.com/k3d-io/k3d'
license=('MIT')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/k3d-io/k3d/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fae4ffc61987321b58b562d7d6c6c0e60c148eb47a9dfeddb330937ef06b3523')
makedepends=('go')
provides=('k3d')

build() {
  cd $_pkgname-$pkgver
  export VERSION=$pkgver
  make build
}

package() {
  install -Dm 755 "${srcdir}/$_pkgname-$pkgver/bin/k3d" "${pkgdir}/usr/bin/k3d"

  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/k3d" completion bash > "${pkgdir}/usr/share/bash-completion/completions/k3d"
  "${pkgdir}/usr/bin/k3d" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_k3d"
}
