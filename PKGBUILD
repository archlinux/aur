# Maintainer: Johannes Bruederl <johannes.bruederl@gmail.com>
# Contributor: Michał Lisowski <lisu@riseup.net>

pkgname=kaf
pkgver=0.1.40
pkgrel=2
pkgdesc="Kafka CLI inspired by kubectl & docker"
arch=('x86_64')
license=('Apache')
url="https://github.com/birdayz/kaf"
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/birdayz/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('31dee0163cc5006559148addcf4950e1')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m755 kaf "${pkgdir}/usr/bin/${pkgname}"

  # Generate bash completion script
  mkdir -p "${pkgdir}/etc/bash_completion.d"
  ./kaf completion bash > "${pkgdir}/etc/bash_completion.d/kaf"

  # Generate zsh completion script
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
  ./kaf completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_kaf"
}

