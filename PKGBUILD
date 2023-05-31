# Maintainer: Nonie <read_only@gmx.us>
#
# Contributor: Alley_Cat <read_only@gmx.us>
#
_pkgname="opera-proxy"
pkgname="opera-proxy-git"
pkgver="1.2.4"
pkgrel="1"
pkgdesc="Standalone Opera VPN client as http-proxy backend only"
url="https://github.com/Snawoot/opera-proxy"
license=('MIT')
depends=('go' 'proxychains-ng')
makedepends=('git')
arch=('i686' 'x86_64')
source=(	"git+https://github.com/Snawoot/opera-proxy.git"
			"topera"
         "proxychains.opera-proxy.conf"
)
sha512sums=('SKIP'
            'a1a3f35210fac1d6e80084a8877800e83e8e70e98a54ae509cd60a9018556ee360ed2b90ad60dc7f8c10aff67746afbe31bf3d3ce6549f1bb1c540607fe283df'
            '719562c938d287656e09bc026dc366c7c3bc41801e729b3496251da86debfa28bb9b6ae0512a5db650ef3dbbc56dedd618874bce3f18ca112a08785ec357a1e2')

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    install -Dm755 "$srcdir"/$_pkgname/bin/opera-proxy -t "$pkgdir"/usr/bin/
    install -Dm755 "$srcdir/topera" "$pkgdir/usr/bin/redsocks"
    install -Dm644 "$srcdir/proxychains.opera-proxy.conf" "$pkgdir/etc/proxychains.opera-proxy.conf"
    install -Dm644 "$srcdir/$_pkgname/README.md" "$pkgdir/usr/share/doc/opera-proxy/README"
}

# vim:set ts=4 sw=2 ft=sh et:
