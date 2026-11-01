# Maintainer: vash909 <iu1bot@xzgroup.net>
pkgname=posirc
pkgver=0.3.1beta2
pkgrel=1
pkgdesc='Small C99 IRC client with verified TLS, a Unicode terminal UI and Unix pipes'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url='https://github.com/vash909/POSIRC'
license=('GPL-3.0-only')
depends=('glibc' 'ncurses' 'openssl' 'ca-certificates')
_version=0.3.1-beta.2
source=("$url/releases/download/v$_version/posirc-$_version-source.tar.gz")
sha256sums=('4f71268a37b800b7d128cb00ebf034236d433aaed14990ecebb69efb818fc6a0')

build() {
    cd "$srcdir/posirc-$_version"
    make CFLAGS="-std=c99 $CFLAGS" CPPFLAGS="-Iinclude $CPPFLAGS" LDFLAGS="$LDFLAGS"
}

check() {
    cd "$srcdir/posirc-$_version"
    make test ui-test integration-test \
        CFLAGS="-std=c99 $CFLAGS" CPPFLAGS="-Iinclude $CPPFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
    cd "$srcdir/posirc-$_version"
    install -Dm755 posirc "$pkgdir/usr/bin/posirc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/posirc/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/posirc/README.md"
    cp -a docs "$pkgdir/usr/share/doc/posirc/"
}
