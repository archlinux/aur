# Maintainer: Gurov <gurov@disroot.org>
pkgname=zeptofetch-git
pkgver=r160.3e692c3
pkgrel=1
pkgdesc="Blazingly fast, ultra-minimal system information tool for Linux (git version)"
arch=('x86_64')
url="https://gitlab.archlinux.org/gurov/zeptofetch"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git')
provides=('zeptofetch')
conflicts=('zeptofetch' 'zeptofetch-bin')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" STRIP=true
}

check() {
  cd "$pkgname"
  make check
}

package() {
  cd "$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
