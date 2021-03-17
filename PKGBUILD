# Maintainer: Lorenz Steinert <lorenz@steinerts.de>

pkgname=mympd
_pkgname=myMPD
pkgver=6.12.0
pkgrel=1
pkgdesc="A standalone and lightweight MPD web client."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jcorporation/myMPD"
license=('GPL2')
depends=('pcre'  'openssl' 'libid3tag' 'flac' 'lua')
optdepends=()
makedepends=('cmake' 'perl')
backup=('etc/webapps/mympd/mympd.conf')
install=mympd.install
source=("https://github.com/jcorporation/myMPD/archive/v$pkgver.tar.gz")
sha256sums=('631f3b215f773a3bac6360e29c060cd48668bd285f4c60bf147d19bee2530302')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -d release
    ./build.sh createassets
    cd release
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=RELEASE ..
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/release"
    make DESTDIR="$pkgdir/" install
}
