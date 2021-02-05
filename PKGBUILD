# Maintainer: Lorenz Steinert <lorenz@steinerts.de>

pkgname=mympd
_pkgname=myMPD
pkgver=6.11.1
pkgrel=1
pkgdesc="A standalone and lightweight MPD web client."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/jcorporation/myMPD"
license=('GPL2')
# jre-openjdk-headless is only needed for the build of mympd and can be removed afterwards.
optdepends=('openssl' 'libid3tag' 'flac' 'lua' 'jre-openjdk-headless')
makedepends=('cmake' 'perl')
backup=('etc/webapps/mympd/mympd.conf')
install=mympd.install
source=("https://github.com/jcorporation/myMPD/archive/v$pkgver.tar.gz")
sha256sums=('a1e88697fbc5775297206907925deef6155b3a7575607037dace698d2e214fd8')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -d release
    cd release
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=RELEASE ..
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/release"
    make DESTDIR="$pkgdir/" install
}
