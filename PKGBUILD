# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: fossdd <fossdd@pwned.life
# Contributor: Julian <juliannfairfax@protonmail.com>
pkgname=pipeline-gtk
pkgver=4.0.3
pkgrel=1
pkgdesc="Watch YouTube and PeerTube videos in one place"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/schmiddi-on-mobile/pipeline"
license=('GPL-3.0-or-later')
depends=(
  'clapper-enhancers'
  'gtk4'
  'libadwaita'
  'libclapper'
  'libclapper-gtk'
  'openssl'
  'sqlite'
  'yt-dlp'
)
makedepends=(
  'blueprint-compiler'
  'cargo'
  'meson'
)
conflicts=('tubefeeder')
source=("$url/-/archive/$pkgver/pipeline-$pkgver.tar.gz")
sha256sums=('4b8c5b93f2f45c98db56046eb651fadafd46913150722d3b0daf22b59815fec8')

prepare() {
  cd pipeline-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  export RUSTUP_TOOLCHAIN=stable
	arch-meson pipeline-$pkgver build
	meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"
}
