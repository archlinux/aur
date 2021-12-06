# Maintainer: tytan652 <tytan652@tytanium.xyz>
# Contributor: Jack O'Sullivan <jackos1998 at gmail dot com>

pkgname=obs-gstreamer
pkgver=0.3.2
pkgrel=2
pkgdesc="An OBS Studio source plugin to feed GStreamer launch pipelines into OBS Studio."
arch=('i686' 'x86_64' 'aarch64')
url="https://obsproject.com/forum/resources/obs-gstreamer.696/"
license=('GPL2')
depends=('obs-studio' 'gst-plugins-base-libs')
makedepends=('git' 'meson')
source=("git+https://github.com/fzwoch/obs-gstreamer#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git cherry-pick --no-commit 219a62963f206ef521eb1b12dddd5b971348128b
}

build() {
	meson "$srcdir/$pkgname" build --prefix=/usr
	ninja -C build
}
package() {
	DESTDIR="$pkgdir" ninja -C build install
}
