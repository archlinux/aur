# Maintainer: ftk

_pkgname='wireproxy-awg'
pkgname="${_pkgname}-bin"
pkgver=1.0.13
pkgrel=1
pkgdesc="AmneziaWG compatible wireguard client that exposes itself as a socks5 proxy"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/artem-russkikh/wireproxy-awg"
license=('ISC-1')
depends=('glibc')
provides=(${_pkgname} wireproxy)
conflicts=(${_pkgname} wireproxy)
source_x86_64=("${url}/releases/download/v${pkgver}/wireproxy_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/wireproxy_linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/wireproxy_linux_arm.tar.gz")
sha256sums_x86_64=('bcb1bc5ed5ed7c4ec53560f7891059031f3dc1b1c12c32f2b9f13bc2a66d89af')
sha256sums_aarch64=('c8578030c22b8a39522e19017e63caac3e232e9d6dc93d18369a5e23aea05496')
sha256sums_armv7h=('ae59375030b03b552089d832ed148b26842ee9082361ff9d2ff42d2f1f8220cd')


package() {
    install -Dm755 "$srcdir/wireproxy" "$pkgdir/usr/bin/wireproxy"
}

_update_pkg() {
    curl -Ssf "${url}/releases.atom" | grep '/releases/tag/' | sed -E 's@^.*/releases/tag/(.*)".*$@\1@; s@^v@@' | head -n 1 | grep '^[0-9][0-9\.]*$'
}
