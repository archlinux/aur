# Maintainer Pol Marcet Sardà <polmarcetsarda@gmail.com>

pkgname=doomseeker
pkgver=1.5.2.r0.g0636b22e
pkgrel=1
epoch=1
pkgdesc="A cross-platform Doom server browser"
arch=(i686 x86_64)
url="https://doomseeker.drdteam.org/"
license=("LGPL")

depends=('zlib' 'bzip2' 'qt5-tools' 'qt5-base' 'qt5-multimedia')
makedepends=('cmake' 'git')
optdepends=('zandronum: GZDoom fork supporting client/server multiplayer'
            'odamex: Classic client/server multiplayer fork'
            'chocolate-doom: Doom source port accurately reproducing the original DOS versions of Doom')

source=('doomseeker::git+https://bitbucket.org/Doomseeker/doomseeker#tag=1.5.2')
sha256sums=('072bfb4d6e9d2e5048828ee1e3fe3fd997257fd131c2b37c1693ddd264e732d7')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build
    cd build
    cmake   -DCMAKE_BUILD_TYPE=Release                              \
            -DCMAKE_INSTALL_PREFIX=/usr                             \
            ..
    make
}

package() {
    cd "$srcdir/$pkgname/build/"
    make DESTDIR=$pkgdir install
}
