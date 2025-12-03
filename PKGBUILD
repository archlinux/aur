# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='certbot-dns-duckdns'
_pkgverUpstream="1.7.1"
pkgver="$_pkgverUpstream"
pkgrel=1
pkgdesc="Plugin for certbot for a DNS-01 challenge with a DuckDNS domain"
arch=('any')
url='https://github.com/infinityofspace/certbot_dns_duckdns'
license=('MIT')
depends=('certbot' 'python-dnspython' 'python-requests')
makedepends=( 'python-build' 'python-installer' 'python-wheel' )
source=("https://github.com/infinityofspace/certbot_dns_duckdns/archive/refs/tags/v${_pkgverUpstream}.tar.gz")
sha384sums=('781523b5c7fcc217dc750ffb71bad19ee50458a168dfb02e1cc28bda493853f7b37581bfc619a47bea6831e7db844354')

build() {
    local srcRootDir="${srcdir}/certbot_dns_duckdns-${_pkgverUpstream}"
    cd "$srcRootDir" || return 1

    python -m build --wheel --no-isolation
}

package() {
    local srcRootDir="${srcdir}/certbot_dns_duckdns-${_pkgverUpstream}"
    cd "$srcRootDir" || return 1

    python -m installer --destdir="$pkgdir" dist/*.whl
}
