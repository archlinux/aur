# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=symfony-cli
pkgrel=8
pkgver=5.16.0
pkgdesc="The Symfony client helps developers create and manage Symfony applications."
url="https://symfony.com/"
arch=('x86_64')
license=('AGPL3')
depends=('glibc')
makedepends=('git' 'go')
provides=('symfony-cli')
conflicts=('symfony-cli')
source=(
    "git+https://github.com/symfony-cli/symfony-cli#tag=v${pkgver}"
)
sha256sums=('SKIP')

build() {
  cd "symfony-cli"

  DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  PKGVER=${pkgver}

  go mod download
  go build -trimpath -ldflags '-s -w -X main.channel=stable -X main.buildDate='"${DATE}"' -X main.version='"${PKGVER}"''
}

package() {    
    install -D -m 755 "${srcdir}/symfony-cli/symfony-cli" "${pkgdir}/usr/bin/symfony"
}
