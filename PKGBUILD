# Maintainer: ivanich
pkgname=kodi-addon-inputstream-ffmpegdirect
pkgver=21.3.5
pkgrel=4
pkgdesc="Inputstream ffmpegdirect kodi plugin"
_koditarget=Omega
_gitname=inputstream.ffmpegdirect
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://github.com/xbmc/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'git' 'pkgconf')
provides=('kodi-addon-inputstream-ffmpegdirect')
depends=('kodi')
source=("https://github.com/xbmc/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz")

sha256sums=('b28ccbd489d9b69779fd818ee158f69ebd6fd85b1f0410ffc8098ff0c8665bdc')

build() {
    mkdir -p "${_gitname}-${pkgver}-${_koditarget}/build"
    cd "${_gitname}-${pkgver}-${_koditarget}/build"

    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        ..
    make
}

package() {
    cd "${_gitname}-${pkgver}-${_koditarget}/build"
    make DESTDIR="${pkgdir}" install
}

# Conditionally add kodi-rpi-dev to arm arch only
if [[ $CARCH == 'armv6h' || $CARCH == 'armv7h'  || $CARCH == 'aarch64' ]]; then
    makedepends+=('kodi-rpi-dev')
fi
