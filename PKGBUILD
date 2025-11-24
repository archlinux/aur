# Maintainer: Edvin Nilsson  <aur at edvinnilsson dot se>
pkgname=davinci-ffmpeg-encoder-plugin
pkgver=1.2.1
pkgrel=1
pkgdesc="FFmpeg Encoder Plugin for DaVinci Resolve Studio"
arch=('x86_64')
url="https://github.com/EdvinNilsson/ffmpeg_encoder_plugin"
license=('GPL-3.0-or-later')
depends=('ffmpeg')
makedepends=('cmake')
optdepends=('davinci-resolve-studio' 'davinci-resolve-studio-beta')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EdvinNilsson/ffmpeg_encoder_plugin/archive/v${pkgver}.tar.gz")
sha256sums=('43e68bbf01dd96f5dd314343df5cf3878e8a8254bed6f741b15c00f91ee97061')

build() {
	cd "$srcdir/ffmpeg_encoder_plugin-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd "$srcdir/ffmpeg_encoder_plugin-$pkgver"
	mkdir -p "$pkgdir/opt/resolve/IOPlugins/ffmpeg_encoder_plugin.dvcp.bundle/Contents/Linux-x86-64/"
	cp ffmpeg_encoder_plugin.dvcp "$pkgdir/opt/resolve/IOPlugins/ffmpeg_encoder_plugin.dvcp.bundle/Contents/Linux-x86-64/"
}
