# Maintainer: Lorenz Steinert <lorenz@steinerts.de>

pkgname=mympd
_pkgname=myMPD
pkgver=6.11.0
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
sha256sums=('0f9bf16bc516eb60b2609c773416dd7f89c8991e49b17b8bffe76f68e75453ca')

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
