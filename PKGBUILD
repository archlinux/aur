## Maintainer: Thermi <noel[ at ] familie-kuntze.de>
# Submitter: nullie
pkgname=lsyncd
pkgver=2.2.2
pkgrel=1
pkgdesc="Live Syncing (Mirror) Daemon"
arch=('i686' 'x86_64')
url="https://github.com/axkibe/lsyncd"
license=('GPL2')
depends=('lua52' 'rsync')
makedepends=('asciidoc' 'lua52' 'cmake')
source=("https://github.com/axkibe/lsyncd/archive/release-$pkgver.tar.gz"
	    "lsyncd.service")

sha256sums=('0bdb12f40f1a52ed2d8e6cb47242d296663a42b30f38d2b8efcb66b43129e009'
            '538072a4505abbdf8c4d16c9200810d4a2253f892a71fc16b5cd7f35ebe1ae57')

build() {
    cd $srcdir/$pkgname-release-$pkgver
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd $srcdir/$pkgname-release-$pkgver/build
    make DESTDIR=$pkgdir install
    # fix the path of the man page. Urgh.
    install -D ${pkgdir}/usr/man/lsyncd.1 ${pkgdir}/usr/share/man/man1/lsyncd.1
    rm -rf ${pkgdir}/usr/man
    install -D ${srcdir}/lsyncd.service ${pkgdir}/usr/lib/systemd/system/lsyncd.service
}
