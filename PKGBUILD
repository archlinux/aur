# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>

_pkgname=paper-plane
pkgname=paper-plane-git
pkgver=r1316.08f8b84
pkgrel=1
pkgdesc='Chat over Telegram on a modern and elegant client'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/paper-plane-developers/paper-plane'
license=(GPL3)
depends=(gtk4-telegrand libadwaita-git libtd-dev rlottie-telegrand-git libtdjson.so)
makedepends=(git meson rust blueprint-compiler)
provides=(paper-plane)
conflicts=(paper-plane)

source=("git+$url.git")
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
