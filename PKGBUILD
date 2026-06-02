# Maintainer: Ash Price <eisleggje@gmail.com>

pkgname=fcitx5-eurolatin-nihon
_pkgname=fcitx5-nihon-eurolatin-git
pkgver=r2.c2b03bb
pkgrel=1
pkgdesc="An fcitx5 IME for typing the three major Japanese romanisations: kunreisiki, nihonsiki, and Hepburn"
arch=('i686' 'x86_64')
url="https://github.com/ashprice/fcitx5-eurolatin-nihon"
license=('MIT')
depends=('fcitx5-chinese-addons' 'libime')
makedepends=('cmake' 'git')
provides=('fcitx5-eurolatin-nihon')
conflicts=('fcitx5-eurolatin-nihon')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/fcitx5-eurolatin-nihon"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/fcitx5-eurolatin-nihon"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/fcitx5-eurolatin-nihon"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
