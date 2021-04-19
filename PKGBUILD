# Maintainer: Akari-chan <`echo bWkudnUuc2VkYWlAZ21haWwuY29tCg== | base64 -d`>
# Upstream author: Chris Bouchard <https://github.com/chrisbouchard>

pkgname=namespaced-wireguard-vpn-git
_pkgname=namespaced-wireguard-vpn
pkgver=r30.0ac54bb
pkgrel=1

pkgdesc='Systemd configuration for a network namespace containing a WireGuard VPN connection'
url='https://github.com/chrisbouchard/namespaced-wireguard-vpn'
arch=('any')
license=('MIT')

depends=('findutils' 'wireguard-tools' 'bash')
makedepends=('git')

source=("$pkgname::git+https://github.com/chrisbouchard/namespaced-wireguard-vpn")
sha256sums=(SKIP)

provides=("$_pkgname")
conflicts=("$_pkgname")

backup=(etc/$_pkgname/namespaced-wireguard-vpn.conf)

pkgver() {
    cd "$srcdir/$pkgname"
    printf 'r%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"

    install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -m 644 -D README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"


    # why not sbin: https://stackoverflow.com/a/51032471
    install -m 755 -D -t "$pkgdir/usr/bin" bin/*

    install -m 600 -D -t "$pkgdir/etc/$_pkgname" conf/*

    install -m 644 -D -t "$pkgdir/usr/lib/systemd/system" systemd/*
}
