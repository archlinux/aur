# Maintainer: Felipe Facundes
pkgname=audacity-openvino-bin
pkgver=3.7.5
pkgrel=1
pkgdesc="Modified Audacity with mod-openvino support for AI audio separation (binary version)"
arch=('x86_64')
url="https://github.com/felipefacundes/audacity-openvino"
license=(GPL-3.0-or-later)
depends=(
  libtorch-cxx11abi-cpu 
  alsa-lib expat flac gcc-libs glibc gdk-pixbuf2 glib2 gtk3
  jack lame libid3tag libmad libogg libsbsms libsndfile libsoxr
  libvorbis libx11 lilv mpg123 opusfile portaudio portmidi portsmf
  vamp-plugin-sdk wavpack wxwidgets-common openvino openvino-models
  python soundtouch sqlite suil twolame util-linux-libs wxwidgets-gtk3
)
optdepends=('libtorch-cxx11abi-cuda: To accelerate AI effects on Nvidia hardware')
conflicts=('audacity' 'audacity-openvino')
provides=(
	ladspa-host
	lv2-host
	vamp-host
	vst-host
	vst3-host
	audacity
)
source=("$pkgname-$pkgver.tar.zst::https://github.com/felipefacundes/audacity-openvino/releases/download/$pkgver/audacity-openvino-1.$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('adbffe2d720571acbe779b225d7318fbdf9d8aa218f1028b03735b2248e03592')

package() {
    # Simply copy the binary package structure to the installation directory
    cp -r "$srcdir/"* "$pkgdir"

	# Set correct permissions for all files and directories
    find "$pkgdir" -type d -exec chmod 755 {} \;
    find "$pkgdir" -type f -exec chmod 644 {} \;
    
    # Set execution permissions for binaries if necessary
    if [ -d "$pkgdir/usr/bin" ]; then
        find "$pkgdir/usr/bin" -type f -exec chmod 755 {} \;
    fi
    
    # Specific permissions for libraries, if applicable
    if [ -d "$pkgdir/usr/lib" ]; then
        find "$pkgdir/usr/lib" -name "*.so*" -type f -exec chmod 755 {} \;
    fi
}