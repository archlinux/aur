# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>

pkgname=xdotool-git
pkgver=3.20160805.1.r24.g6523b5f
pkgrel=1
pkgdesc='Command-line X11 automation tool (git version)'
arch=('x86_64')
url='https://www.semicomplete.com/projects/xdotool/'
license=('BSD')
depends=('libxtst' 'libxinerama' 'libxkbcommon')
makedepends=('git')
provides=('xdotool')
conflicts=('xdotool' 'xdotool-svn')
replaces=('xdotool-svn')
source=('git+https://github.com/jordansissel/xdotool.git')
md5sums=('SKIP')

pkgver() {
    cd xdotool
    
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd xdotool
    
    make WITHOUT_RPATH_FIX='1'
}

package() {
    cd xdotool
    make PREFIX='/usr' INSTALLMAN='/usr/share/man' DESTDIR="$pkgdir" install
    
    # remove execute bit from header file
    chmod a-x "${pkgdir}/usr/include/xdo.h"
    
    install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
