# Maintainer: Antoine POPINEAU <antoine at popineau dot eu>

pkgname=greetd-tuigreet-git
pkgver=0.2.0.r56.ad06a85
pkgrel=1

pkgdesc='A console UI greeter for greetd'
url='https://github.com/apognu/tuigreet'
license=(GPL3)
conflicts=(greetd-tuigreet greetd-tuigreet-bin)

arch=(x86_64)
depends=()
makedepends=(git rust)

source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd tuigreet
  printf "%s.r%s.%s" "$(git describe --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd tuigreet
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/tuigreet/target/release/tuigreet" "${pkgdir}/usr/bin/tuigreet"
  install -Dm644 "${srcdir}/tuigreet/LICENSE" "${pkgdir}/usr/share/licenses/tuigreet/LICENSE"

  install -Dd -ogreeter -ggreeter -m755 "${pkgdir}/var/cache/tuigreet"
}
