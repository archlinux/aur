# Maintainer: Ash Price <eisleggje@gmail.com>

pkgname=fcitx5-eurolatin-sil
_pkgname=fcitx5-ipa-eurolatin-git
pkgver=r25.fa79da7
pkgrel=1
pkgdesc="An fcitx5 table layout replicating the Eurolatin SIL keyman layout (preliminary/incomplete release)"
arch=('i686' 'x86_64')
url="https://github.com/ashprice/fcitx5-eurolatin-sil"
license=('MIT')
depends=('fcitx5-chinese-addons' 'libime')
makedepends=('cmake' 'git')
provides=('fcitx5-eurolatin-sil')
conflicts=('fcitx5-eurolatin-sil')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/fcitx5-eurolatin-sil"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/fcitx5-eurolatin-sil"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/fcitx5-eurolatin-sil"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
