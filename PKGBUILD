# Maintainer: wast3
pkgname=kodi-addon-inputstream-ffmpegdirect
pkgver=21.3.8
pkgrel=3
pkgdesc="Inputstream ffmpegdirect kodi plugin"
_koditarget=Omega
_gitname=inputstream.ffmpegdirect
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://github.com/xbmc/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'git' 'pkgconf' 'kodi-dev')
provides=('kodi-addon-inputstream-ffmpegdirect')
depends=('kodi' 'ffmpeg6.1')
source=("https://github.com/xbmc/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz")

sha256sums=('0648c6bbb2143cec0c3f48ad476f2c213f20c809caaf5ac74c8ceb4e53635f4e')

build() {
    mkdir -p "${_gitname}-${pkgver}-${_koditarget}/build"
    cd "${_gitname}-${pkgver}-${_koditarget}/build"

    PKG_CONFIG_PATH=/usr/lib/ffmpeg6.1/pkgconfig cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
	-DLIBXML2_INCLUDE_DIRS=/usr/include/libxml2/libxml \
        ..
    make
}

package() {
    cd "${_gitname}-${pkgver}-${_koditarget}/build"
    make DESTDIR="${pkgdir}" install
}
