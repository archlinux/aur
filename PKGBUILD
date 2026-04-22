# Maintainer: Zaman Huseynli <zamanhuseynli23@gmail.com>
# Backup contact: admin@azccriminal.space
pkgname=wasma-git
pkgver=r85.g962966d
pkgrel=1
pkgdesc="Window Assigment System Monitoring Advanced (git)"
arch=('x86_64')
url="https://github.com/Azencorporation/Wasma"
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'wayland'
  'wayland-protocols'
  'libinput'
  'libxkbcommon'
)
makedepends=('git' 'cargo')
provides=('wasma')
conflicts=('wasma')

source=("git+https://github.com/Azencorporation/Wasma.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Wasma"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/Wasma"

  cargo build --release --workspace \
    --exclude wasma-windows-platform \
    --exclude wasma-windows-platform-xf86 \
    --exclude wasma-windows-platform-wasma-sys \
    --exclude wasma-legacy-platform
}

package() {
  cd "$srcdir/Wasma"

  # main tools
  install -Dm755 target/release/wasma "$pkgdir/usr/bin/wasma"
  install -Dm755 target/release/wasma_backend "$pkgdir/usr/bin/wasma_backend"
  install -Dm755 target/release/waylandbackend "$pkgdir/usr/bin/waylandbackend"
  install -Dm755 target/release/wsdg-env "$pkgdir/usr/bin/wsdg-env"
  install -Dm755 target/release/wsdg-open "$pkgdir/usr/bin/wsdg-open"
  install -Dm755 target/release/wasma-ubin "$pkgdir/usr/bin/wasma-ubin"
  install -Dm755 target/release/x11-backend "$pkgdir/usr/bin/x11-backend"
}
