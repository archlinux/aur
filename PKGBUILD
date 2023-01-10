# Maintainer: tytan652 <tytan652@tytanium.xyz>
# Contributor: Jack O'Sullivan <jackos1998 at gmail dot com>

pkgname=obs-gstreamer
pkgver=0.4.0
pkgrel=1
epoch=1
pkgdesc="An OBS Studio source plugin to feed GStreamer launch pipelines into OBS Studio."
arch=('i686' 'x86_64' 'aarch64')
url="https://obsproject.com/forum/resources/obs-gstreamer.696/"
license=('GPL2')
depends=('obs-studio' 'gst-plugins-base-libs')
makedepends=('git' 'meson')
optdepends=("gstreamer-vaapi: GStreamer VAAPI encoder")
options=('debug')
source=("git+https://github.com/fzwoch/obs-gstreamer#tag=v$pkgver")
sha256sums=('SKIP')

prepare()
{
	cd "$pkgname"
	git revert -n 4ca74407b0e056df5d8d57526bf41dfcb100f333
}

build() {
	meson "$srcdir/$pkgname" build --prefix=/usr --buildtype=release
	ninja -C build
}
package() {
	DESTDIR="$pkgdir" ninja -C build install
}
