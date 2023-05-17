# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>

_pkgname=paper-plane
pkgname=paper-plane-git
pkgver=0.1.0.beta.1.r0.g83df76b
pkgrel=1
pkgdesc='Chat over Telegram on a modern and elegant client'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/paper-plane-developers/paper-plane'
license=(GPL3)
depends=(gtk4-paper-plane libadwaita-git libtd-dev rlottie-paper-plane-git libtdjson.so)
makedepends=(git meson rust blueprint-compiler appstream)
provides=(paper-plane)
conflicts=(paper-plane)

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # The API ID and hash provided here are for use with Paper Plane only.
  # For other projects, please get your own API ID and hash at https://my.telegram.org/apps

  arch-meson "$_pkgname" build \
    -Dtg_api_id=22303002 \
    -Dtg_api_hash=3cc0969992690f032197e6609b296599

  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
