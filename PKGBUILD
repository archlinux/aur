# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=xqf-git
pkgver=1.0.6.2.r25.gfb2ba3c
pkgrel=1
pkgdesc="XQF is a game server browser and launcher for Unix/X11 for many popular games (a qstat frontend)"
url="http://www.linuxgames.com/xqf/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qstat' 'gtk2' 'geoip')
makedepends=('git' 'intltool')
replaces=('xqf-cvs' 'xqf-svn')
conflicts=('xqf' 'xqf-cvs' 'xqf-svn')
provides=('xqf')
source=('xqf::git+https://github.com/XQF/xqf.git')
sha256sums=('SKIP')

pkgver() {
    cd xqf
    git describe --long --tags | sed -r 's/^xqf.//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/xqf"

    ./autogen.sh --prefix=/usr
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/xqf"

    make DESTDIR="${pkgdir}" install
}
