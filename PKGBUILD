# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=ghorg
pkgver=1.9.6
pkgrel=1
pkgdesc='allows you to quickly clone all of an orgs, or users repos into a single directory.'
arch=('x86_64')
url='https://github.com/gabrie30/ghorg'
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabrie30/ghorg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f58b3df0c34440f5d5da2a0925287134e4ce7c71cb9f3c15a40fafda3bcc78e7')

build() {
  cd $pkgname-$pkgver
  go build
}

package() {
  install -Dm 755 "${pkgname}-${pkgver}/ghorg" "${pkgdir}/usr/bin/ghorg"

  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/ghorg" completion bash > "${pkgdir}/usr/share/bash-completion/completions/ghorg"
  "${pkgdir}/usr/bin/ghorg" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_ghorg"
}
