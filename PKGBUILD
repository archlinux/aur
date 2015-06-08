# Maintainer: Alessandro Pazzaglia <jackdroido at gmail dot com>

pkgname=lximediaserver-svn
pkgver=0.5.0.r1179
pkgrel=1
pkgdesc="A lightweight VLC based transcoding DLNA server"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/lximedia/"
license=('GPL3')
depends=('vlc')
makedepends=('subversion' 'cmake')
options=('!buildflags')
source=("$pkgname::svn+http://svn.code.sf.net/p/lximedia/code/trunk")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug .
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}

pkgver() {
    cd "$pkgname"
    local release="$(cat VERSION)"
    local version="$(svnversion )"
    printf "%s.r%s" "${release}" "${version//[[:alpha:]]}"
}
