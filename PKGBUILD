# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>

_pkgname=telegrand
pkgname=$_pkgname-git
pkgver=r306.47975be
pkgrel=1
pkgdesc='A Telegram client for GNOME'
arch=(x86_64 i686)
url="https://github.com/melix99/$_pkgname"
depends=(gtk4 libadwaita-git telegram-tdlib)
makedepends=(git rust meson)
license=(GPL3)
source=("git+https://github.com/melix99/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson $_pkgname build \
    -Dtg_api_id=611335 \
    -Dtg_api_hash=d524b414d21f4d37f08684c1df41ac9c

  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
