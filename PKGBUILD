# Maintainer: Ash Price <eisleggje@gmail.com>

pkgname=fcitx5-ipa-sil
_pkgname=fcitx5-ipa-sil-git
pkgver=r15.8438681
pkgrel=1
pkgdesc="An fcitx5 table layout replicating the SIL IPA keyman layout"
arch=('i686' 'x86_64')
url="https://github.com/ashprice/fcitx5-ipa-sil"
license=('MIT')
depends=('fcitx5-chinese-addons' 'libime')
makedepends=('boost' 'cmake' 'git')
provides=('fcitx5-ipa-sil')
conflicts=('fcitx5-ipa-sil')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/fcitx5-ipa-sil"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/fcitx5-ipa-sil"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/fcitx5-ipa-sil"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
