# Maintainer: Edvin Nilsson  <aur at edvinnilsson dot se>
pkgname=davinci-ffmpeg-encoder-plugin
pkgver=1.3.1
pkgrel=1
pkgdesc="FFmpeg Encoder Plugin for DaVinci Resolve Studio"
arch=('x86_64')
url="https://github.com/EdvinNilsson/ffmpeg_encoder_plugin"
license=('GPL-3.0-or-later')
depends=('ffmpeg')
makedepends=('cmake')
optdepends=('davinci-resolve-studio')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EdvinNilsson/ffmpeg_encoder_plugin/archive/v${pkgver}.tar.gz")
sha256sums=('887619cf5226480b52fa3f87d8a32e00c31536e6b10e4f4891f2563155caceb6')

build() {
	cd "$srcdir/ffmpeg_encoder_plugin-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release .
	cmake --build .
}

package() {
	cd "$srcdir/ffmpeg_encoder_plugin-$pkgver"
	mkdir -p "$pkgdir/opt/resolve/IOPlugins/ffmpeg_encoder_plugin.dvcp.bundle/Contents/Linux-x86-64/"
	cp ffmpeg_encoder_plugin.dvcp "$pkgdir/opt/resolve/IOPlugins/ffmpeg_encoder_plugin.dvcp.bundle/Contents/Linux-x86-64/"
}
