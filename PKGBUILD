# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=xqf-git
pkgver=1.0.6.2.r134.ge6b51fd
pkgrel=1
pkgdesc="A game server browser and launcher for Unix/X11 for many popular games (a qstat frontend)"
url="https://xqf.github.io/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qstat' 'gtk2' 'geoip' 'minizip')
makedepends=('cmake' 'git' 'gettext')
replaces=('xqf-cvs' 'xqf-svn')
conflicts=('xqf' 'xqf-cvs' 'xqf-svn')
provides=('xqf')
install=xqf-git.install
source=('xqf::git+https://github.com/XQF/xqf.git')
sha256sums=('SKIP')

pkgver() {
    cd xqf
    git describe --long --tags | sed -r 's/^xqf.//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/xqf"

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_GEOIP=ON .
    make
}

package() {
    cd "${srcdir}/xqf"

    make DESTDIR="${pkgdir}" install
}
