# Maintainer: Lorenz Steinert <lorenz@steinerts.de>

pkgname=mympd
_pkgname=myMPD
pkgver=6.11.3
pkgrel=1
pkgdesc="A standalone and lightweight MPD web client."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/jcorporation/myMPD"
license=('GPL2')
depends=('pcre'  'openssl' 'libid3tag' 'flac' 'lua')
# jre-openjdk-headless is only needed for the build of mympd and can be removed afterwards.
optdepends=('jre-openjdk-headless')
makedepends=('cmake' 'perl')
backup=('etc/webapps/mympd/mympd.conf')
install=mympd.install
source=("https://github.com/jcorporation/myMPD/archive/v$pkgver.tar.gz")
sha256sums=('7ae3a1573c2fbc2e79c3bece832af148a34a7fd6a4b57f2bf7b659e3ba4ba031')

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
