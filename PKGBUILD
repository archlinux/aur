# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mousai
pkgver=0.7.1
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
sha256sums=('c83fa77e277745a044fb1769b3f153f1be351d297eb7f463ef195acbc311c010')

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
