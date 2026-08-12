# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Tomáš Mládek <t@mldk.cz>
pkgname=graph2dot
pkgver=9.0
pkgrel="1"
pkgdesc="parse a filtergraph description and issue a corresponding textual representation in the dot language"
arch=('i686' 'x86_64')
url="https://ffmpeg.org"
license=('GPL-3.0-only')
source=("${url}/releases/ffmpeg-${pkgver}.tar.gz")
makedepends=('nasm' 'chromaprint' 'frei0r-plugins' 'ladspa' 'opencl-headers' 'vulkan-headers' 'avisynthplus' 'amf-headers')
depends=('libdrm' 'libvdpau' 'libva' 'libmysofa' 'libass' 'vmaf' 'zimg' 'lilv' 'rubberband' 'tesseract' 'lcms2' 'libx11' 'harfbuzz' 'fribidi' 'zlib' 'freetype2' 'glibc' 'fontconfig' 'libgcc')
optdepends=('graphviz: dot utility needed to convert gv to png')
sha256sums=('1b12b07e0a6c39fc0025104ed1e9b6096fd1a11628daad8ac98a68d8cfd4ebed')

build() {
	cd "ffmpeg-$pkgver"
	./configure \
	--prefix=/usr \
	--disable-debug \
	--disable-stripping \
	--enable-gpl \
	--enable-lto \
	--enable-version3 \
	--disable-all \
	--enable-avfilter \
	--enable-avutil \
	--enable-filters \
	--enable-swscale \
	--enable-swresample \
	--enable-chromaprint \
	--enable-frei0r \
	--enable-ladspa \
	--enable-lcms2 \
	--enable-libfontconfig \
	--enable-libfreetype \
	--enable-libfribidi \
	--enable-libharfbuzz  \
	--enable-libass \
	--disable-libopencv \
	--enable-librubberband \
	--enable-libtesseract \
	--enable-libvmaf \
	--enable-libzimg \
	--enable-lv2 \
	--enable-libmysofa
	make tools/graph2dot
}

package() {
	cd "$srcdir"
	install -Dm755 ffmpeg-${pkgver}/tools/graph2dot -t "$pkgdir/usr/bin"
}
