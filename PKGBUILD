# Maintainer: Edvin Nilsson  <aur at edvinnilsson dot se>
pkgname=davinci-ffmpeg-encoder-plugin
pkgver=1.5.1
pkgrel=1
pkgdesc="FFmpeg Encoder Plugin for DaVinci Resolve Studio"
arch=('x86_64')
url="https://github.com/EdvinNilsson/ffmpeg_encoder_plugin"
license=('GPL-3.0-or-later')
depends=('ffmpeg')
makedepends=('cmake' 'vulkan-headers')
optdepends=('davinci-resolve-studio')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EdvinNilsson/ffmpeg_encoder_plugin/archive/v${pkgver}.tar.gz")
sha256sums=('a853826d7032d018b551bda85d64df4e5d882ecab225f4888513f03c504721d1')

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
