pkgname='kex-git'
pkgver='r52.96d1fa2'
pkgrel=2
pkgdesc="KolibriOS emulator for running applications in Linux."
url="https://github.com/tsdima/kex"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('curl' '7zip' 'bash')
makedepends=('git' 'libx11' 'libxrender')
install=$pkgname.install
source=("git+${url}.git"
	"kex-setup")
sha256sums=('SKIP'
            '4631599b738deb6f4c3eea8a2e14dd221d26ac33a0d9ae0b027280c9de46e1a0')

pkgver() {
  cd kex
  printf "r% s.% s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
    cd kex
    gcc -o kex main.c k_*.c -lX11 -lXrender -lrt -llzma -ldl -D_GNU_SOURCE
}

package() {
    install -Dm755 kex/kex kex-setup -t "$pkgdir/usr/bin"
}
