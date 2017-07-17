# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=kio-extras
pkgname=${_pkgname}-light
pkgver=17.04.3
pkgrel=1
pkgdesc="Additional components to increase the functionality of KIO, without SMB/Samba support"
arch=('i686' 'x86_64')
url='https://www.kde.org/applications/internet/'
license=('LGPL')
depends=('kdelibs4support' 'kdnssd' 'libssh' 'exiv2' 'openexr' 'openslp' 'libmtp' 'kpty' 'kactivities')
makedepends=('extra-cmake-modules' 'kdoctools' 'kdesignerplugin' 'qt5-webengine' 'python' 'gperf' 'taglib' 'khtml')
optdepends=('qt5-webengine: HTML thumbnailer'
            'qt5-imageformats: thumbnails for additional image formats'
            'kimageformats: thumbnails for additional image formats'
            'taglib: audio file thumbnails'
            'khtml: man kioslave')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
groups=('kde-applications' 'kdenetwork')
source=("https://download.kde.org/stable/applications/${pkgver}/src/${_pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('e18f76631611d9ef74394e204207feaeaf4fa9f6c089f5719a966beed41bf983' 'SKIP')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7'  # Albert Astals Cid <aacid@kde.org>
              'F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87') # Christoph Feck <cfeck@kde.org>


prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../${_pkgname}-${pkgver} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF \
        -DSAMBA_FOUND=OFF
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
