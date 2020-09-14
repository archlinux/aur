# Maintainer: Lorenz Steinert <lorenz@steinerts.de>

pkgname=mympd
_pkgname=myMPD
pkgver=6.6.2
pkgrel=1
pkgdesc="A standalone and lightweight MPD web client."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/jcorporation/myMPD"
license=('GPL2')
optdepends=('openssl' 'libid3tag' 'flac' 'lua')
makedepends=('cmake' 'perl' 'jre-openjdk-headless')
backup=('etc/webapps/mympd/mympd.conf')
install=mympd.install
source=("git+https://github.com/jcorporation/myMPD.git")
sha256sums=('SKIP')

build() {
    cd $srcdir/$_pkgname
    install -d release
    cd release
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=RELEASE ..
    make
}

package() {
    cd $srcdir/$_pkgname/release
    make DESTDIR="$pkgdir/" install
}
