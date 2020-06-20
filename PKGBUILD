# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=nucleon-git
pkgver=r13.48750fe
pkgrel=2
pkgdesc='Dynamic load balancer written in Rust'
arch=('i686' 'x86_64')
url='https://github.com/NicolasLM/nucleon'
license=('MIT')
provides=('nucleon')
depends=('gcc-libs')
makedepends=('rust')
source=("nucleon::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/nucleon"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/nucleon"
  cargo build --release
}

package() {
  cd "${srcdir}/nucleon"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 target/release/nucleon -t "${pkgdir}"/usr/bin 
}