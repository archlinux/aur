# Contributor: Michał Przybyś <michal@przybys.eu>
# Maintainer: Thomas Bork <sudoBash418@gmail.com>
pkgname=strawberry-qt5
pkgver=1.0.4
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
sha256sums=('ec68f42326b70870d1c9c0ad1182136897e299d7d187fbc2994467c19afac07e')


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
