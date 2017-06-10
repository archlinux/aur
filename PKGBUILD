# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=kio-extras
pkgname=${_pkgname}-light
pkgver=17.04.2
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
sha256sums=('d071e1a33108c73c4716bdb7da81bdd06a7bd39fb9649781d21cf08293f504cd' 'SKIP')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7') # Albert Astals Cid <aacid@kde.org>

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
