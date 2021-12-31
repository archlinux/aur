# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>

_pkgname=telegrand
pkgname=telegrand-git
pkgver=r558.df19f42
pkgrel=2
pkgdesc='A Telegram client for GNOME'
arch=(x86_64)
url='https://github.com/melix99/telegrand'
license=(GPL3)
depends=(gtk4 libadwaita libtd-dev)
makedepends=(git meson rust)
provides=(telegrand)
conflicts=(telegrand)
source=('git+https://github.com/melix99/telegrand.git')
sha256sums=('SKIP')
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "$_pkgname" build \
    -Dtg_api_id=611335 \
    -Dtg_api_hash=d524b414d21f4d37f08684c1df41ac9c

  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
