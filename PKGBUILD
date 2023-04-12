# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mousai
pkgver=0.7.2
pkgrel=1
pkgdesc="Simple application for identifying songs"
arch=('x86_64')
url="https://apps.gnome.org/app/io.github.seadve.Mousai"
license=('GPL3')
depends=('gst-plugins-bad-libs' 'gstreamer' 'libadwaita' 'libpulse' 'libsoup3')
makedepends=('cargo' 'meson')
checkdepends=('appstream-glib')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeaDve/Mousai/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('316d1ccdf230ad64a76b3b256637d3ebc0a6cf5d9e1f8c647f6449a60c319c26')

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson Mousai-$pkgver build
  meson compile -C build
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
