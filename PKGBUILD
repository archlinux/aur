# Maintainer Pol Marcet Sardà <polmarcetsarda@gmail.com>

pkgname=doomseeker
pkgver=1.5.3.r0.g59617ba6
pkgrel=1
epoch=1
pkgdesc="A cross-platform Doom server browser"
arch=(i686 x86_64)
url="https://doomseeker.drdteam.org/"
license=("LGPL")

depends=('zlib' 'bzip2' 'qt6-tools' 'qt6-base' 'qt6-multimedia')
makedepends=('cmake' 'git')
optdepends=('zandronum: GZDoom fork supporting client/server multiplayer'
            'q-zandronum: Zandronum fork with improved netcode and Quake movement'
            'odamex: Classic client/server multiplayer fork'
            'chocolate-doom: Doom source port accurately reproducing the original DOS versions of Doom')

source=('doomseeker::git+https://bitbucket.org/Doomseeker/doomseeker#tag=1.5.3')
sha256sums=('723968e6f3f68122875978c2586013e3e69eddbdafbbb103e531e13c9be2bc39')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build
    cd build
    cmake   -DQt_PACKAGE=Qt6                                        \
            -DCMAKE_BUILD_TYPE=Release                              \
            -DCMAKE_INSTALL_PREFIX=/usr                             \
            ..
    make
}

package() {
    cd "$srcdir/$pkgname/build/"
    make DESTDIR=$pkgdir install
}
