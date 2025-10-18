# Maintainer: RAMA <nooviex@gmail.com>

pkgname=sysc-greet-sway
pkgver=1.0.4
pkgrel=1
pkgdesc="A beautiful terminal greeter for greetd with Sway support"
arch=('x86_64')
url="https://github.com/Nomadcxx/sysc-greet"
license=('MIT')
depends=('greetd' 'swww' 'sway' 'kitty')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-greet/archive/v${pkgver}.tar.gz")
sha256sums=('0fc8a2a0da2aa6ffd64d9cee6a7ac26a7249379c9d0650df89974f93114a8916')

build() {
  cd "${srcdir}/sysc-greet-${pkgver}"
  go build -buildvcs=false -o sysc-greet ./cmd/sysc-greet/
}

package() {
  cd "${srcdir}/sysc-greet-${pkgver}"
  
  # Install binary
  install -Dm755 sysc-greet "${pkgdir}/usr/bin/sysc-greet"
  
  # Install ASCII configs
  install -dm755 "${pkgdir}/usr/share/sysc-greet"
  cp -r ascii_configs "${pkgdir}/usr/share/sysc-greet/"
  
  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/sysc-greet/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/sysc-greet/LICENSE"
}
