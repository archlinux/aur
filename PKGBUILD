# Maintainer: Ash Price <eisleggje@gmail.com>

pkgname=fcitx5-eurolatin-nordic
_pkgname=fcitx5-sil-nordic-git
pkgver=r4.2301f06
pkgrel=1
pkgdesc="An fcitx5 IME for typing the major Nordic languages (limited support for Old Norse)"
arch=('i686' 'x86_64')
url="https://github.com/ashprice/fcitx5-eurolatin-nordic"
license=('MIT')
depends=('fcitx5-chinese-addons' 'libime')
makedepends=('cmake' 'git')
provides=('fcitx5-eurolatin-nordic')
conflicts=('fcitx5-eurolatin-nordic')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/fcitx5-eurolatin-nordic"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/fcitx5-eurolatin-nordic"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/fcitx5-eurolatin-nordic"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
