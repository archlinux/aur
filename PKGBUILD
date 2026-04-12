# Maintainer: Edvin Nilsson  <aur at edvinnilsson dot se>
pkgname=davinci-ffmpeg-encoder-plugin
pkgver=1.3.0
pkgrel=1
pkgdesc="FFmpeg Encoder Plugin for DaVinci Resolve Studio"
arch=('x86_64')
url="https://github.com/EdvinNilsson/ffmpeg_encoder_plugin"
license=('GPL-3.0-or-later')
depends=('ffmpeg')
makedepends=('cmake')
optdepends=('davinci-resolve-studio')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EdvinNilsson/ffmpeg_encoder_plugin/archive/v${pkgver}.tar.gz")
sha256sums=('41c7d6226840ebb67c96a24352c92c78a3582254d7f47060b75e666a41773d16')

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
