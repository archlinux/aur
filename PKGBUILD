# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=ghorg
pkgver=1.7.13
pkgrel=1
pkgdesc='allows you to quickly clone all of an orgs, or users repos into a single directory.'
arch=('x86_64')
url='https://github.com/gabrie30/ghorg'
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabrie30/ghorg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c400bc8010e08c5835870453bcdb2438270739ac72612cad85b9d80d39631275')

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
