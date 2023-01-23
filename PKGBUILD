# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=neatvnc-git
pkgver=0.6.0
pkgrel=1
pkgdesc="VNC server library that's intended to be fast and neat"
arch=(x86_64 i686 aarch64 armv7h)
url=https://github.com/any1/neatvnc
license=(custom:ISC)
depends=(
  glibc
  gnutls
  aml
  libpixman-1.so
  libturbojpeg.so
  zlib
  libglvnd
  libdrm
  ffmpeg
)
makedepends=(
  git
  libdrm
  meson
  ninja
)
makedepends=(git meson ninja libdrm)
source=("git+$url")
sha512sums=('SKIP')
conflicts=(neatvnc)
provides=(neatvnc=${pkgver%+*})

pkgver() {
  git -C neatvnc describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  arch-meson neatvnc build # --prefix /usr
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 neatvnc/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
