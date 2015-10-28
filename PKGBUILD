# Maintainer: Vaporeon <vaporeon@tfwno.gf>
pkgname=rustation-git
pkgver=r178.7b04e21
pkgrel=1
pkgdesc=" Playstation emulator in the Rust programing language"
arch=('i686' 'x86_64')
url="https://github.com/simias/rustation"
license=('GPL2')
depends=('sdl2')
makedepends=('cargo')
conflicts=('rustation')
provides=('rustation')
source=("git+https://github.com/simias/rustation.git")
md5sums=('SKIP')

pkgver() {
  cd rustation
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/rustation
  cargo build --release
}

package() {
  cd "$srcdir"/rustation
  install -Dm755 "$srcdir"/rustation/target/release/rustation "$pkgdir"/usr/bin/rustation
  install -Dm644 "$srcdir"/rustation/LICENSE "$pkgdir"/usr/share/licenses/rustation/LICENSE
}
