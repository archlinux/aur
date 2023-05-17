# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>

pkgname=paper-plane
pkgver=0.1.0.beta.1
pkgrel=1
pkgdesc='Chat over Telegram on a modern and elegant client'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/paper-plane-developers/paper-plane'
license=(GPL3)
depends=(gtk4-paper-plane libadwaita-git libtd-dev rlottie-paper-plane-git libtdjson.so)
makedepends=(git meson rust blueprint-compiler appstream)
provides=(paper-plane)
conflicts=(paper-plane)

_commit=83df76b6eb0fae5b51079d80258a96664f686236  # tags/v0.1.0-beta.1^0
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$pkgname" build \
    -Dtg_api_id=611335 \
    -Dtg_api_hash=d524b414d21f4d37f08684c1df41ac9c

  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
