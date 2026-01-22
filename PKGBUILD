# Maintainer: Gur0v
pkgname=zeptofetch-git
pkgver=r160.3e692c3
pkgrel=1
pkgdesc="Blazingly fast, ultra-minimal system information tool for Linux (git version)"
arch=('x86_64')
url="https://gitlab.archlinux.org/gurov/zeptofetch"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git' 'gcc' 'make')
provides=('zeptofetch')
conflicts=('zeptofetch' 'zeptofetch-bin')
source=("git+https://gitlab.archlinux.org/gurov/zeptofetch.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
  cd "$srcdir/zeptofetch"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/zeptofetch"
  unset CFLAGS
  unset LDFLAGS
  make
}

package() {
  cd "$srcdir/zeptofetch"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
