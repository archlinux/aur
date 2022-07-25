# Contributor: Michał Przybyś <michal@przybys.eu>
# Maintainer: Thomas Bork <sudoBash418@gmail.com>
pkgname=strawberry-qt5
pkgver=1.0.7
pkgrel=1
pkgdesc="A music player aimed at audio enthusiasts and music collectors (Qt5 version)"
arch=(x86_64)
url="https://strawberrymusicplayer.org/"
license=(GPL3)

depends=(chromaprint
         protobuf
         gst-plugins-base
         gst-plugins-good
         qt5-x11extras
         udisks2
         libcdio
         libgpod
         libmtp
         fftw)
makedepends=(cmake
             boost
             qt5-tools)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')

provides=(strawberry)
conflicts=(strawberry)

source=("https://github.com/strawberrymusicplayer/strawberry/releases/download/${pkgver}/strawberry-${pkgver}.tar.xz")
sha256sums=('c2d242f091eaeb5bf6c83e8b3b0405e3c5ea89a23845843541726fc81643bd06')


build() {
	cmake -B build -S "strawberry-${pkgver}" \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-DBUILD_WITH_QT5=on \
			-DENABLE_VLC=off
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
