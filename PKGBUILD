# Maintainer: Junio Calu <junio.calu@gmail.com>

pkgname=autoadb
pkgver=r2.6a540d9
pkgrel=1
pkgdesc='Execute a command whenever a device is adb-connected'
arch=('x86_64')
url="https://github.com/rom1v/autoadb"
license=('Apache 2.0')
depends=('android-tools')
makedepends=('rust')
source=("$pkgname::git+https://github.com/rom1v/autoadb.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
   cd "$pkgname"
   cargo test --release --locked
}

build() {
  return 0
}

package() {
  cargo install --no-track --root "${pkgdir}"/usr --path "${srcdir}/${pkgname}"
}