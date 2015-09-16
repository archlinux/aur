# Maintainer: sxe <sxxe@gmx.de>

pkgname='quassel-git-monolithic'
_pkgname='quassel'
pkgver=0.12.0.r22.g1731132
pkgrel=1
pkgdesc='Next-generation distributed IRC client - monolithic'
url='http://quassel-irc.org'
license='GPL'
arch=('i686' 'x86_64')
makedepends=('cmake' 'extra-cmake-modules' 'qt5-base' 'qt5-tools' 'qca-qt5' 'qt5-script' 'knotifyconfig' 'git')
replaces=('quassel')
conflicts=('quassel-monolithic' 'quassel-client')
install='quassel-git-monolithic.install'
source=('quassel::git://git.quassel-irc.org/quassel.git')
md5sums=('SKIP')

pkgver() {
  #date +%Y%m%d
  cd "$srcdir/$_pkgname"
  git describe --always --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^wine.//'
}

build() {
    cd "$srcdir/$_pkgname"
    
    # Monolithic
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DUSE_QT5=ON \
        -DWITH_KDE=ON \
        -DWITH_OPENSSL=ON \
        -DWANT_CORE=OFF \
        -DWANT_QTCLIENT=OFF \
        -DWANT_MONO=ON \
        -DCMAKE_BUILD_TYPE="Release" \
        . \
        -Wno-dev
    make    
    
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
}

