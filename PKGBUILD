# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=rancher-k3d
_pkgname=k3d
pkgver=5.6.0
pkgrel=1
pkgdesc="Little helper to run CNCF's k3s in Docker"
arch=('x86_64')
url='https://github.com/k3d-io/k3d'
license=('MIT')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/k3d-io/k3d/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b9eb05c5fa213c8ec6d34a25e00ae07abeb23d70c94f55c1f32fbc16ea4e480e')
makedepends=('go')
provides=('k3d')

build() {
  cd $_pkgname-$pkgver
  export GIT_TAG_OVERRIDE=$pkgver
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
