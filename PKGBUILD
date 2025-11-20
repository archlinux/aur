# Maintainer: Edvin Nilsson  <aur at edvinnilsson dot se>
pkgname=davinci-ffmpeg-encoder-plugin
pkgver=1.2.0
pkgrel=1
pkgdesc="FFmpeg Encoder Plugin for DaVinci Resolve Studio"
arch=('x86_64')
url="https://github.com/EdvinNilsson/ffmpeg_encoder_plugin"
license=('GPL-3.0-or-later')
depends=('ffmpeg')
makedepends=('cmake')
optdepends=('davinci-resolve-studio' 'davinci-resolve-studio-beta')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EdvinNilsson/ffmpeg_encoder_plugin/archive/v${pkgver}.tar.gz")
sha256sums=('d6e299828b2ded889058670e81a8a4dc3edd95d0ce09d0746e6d6b4fa2090459')

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
