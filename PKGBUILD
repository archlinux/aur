# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='certbot-dns-duckdns'
_pkgverUpstream="1.5"
pkgver="1.5.0"
pkgrel=2
pkgdesc="Plugin for certbot for a DNS-01 challenge with a DuckDNS domain"
arch=('any')
url='https://github.com/infinityofspace/certbot_dns_duckdns'
license=('MIT')
depends=('certbot' 'python-dnspython' 'python-requests')
makedepends=( 'python-build' 'python-installer' 'python-wheel' )
source=("https://github.com/infinityofspace/certbot_dns_duckdns/archive/refs/tags/v${_pkgverUpstream}.tar.gz")
sha256sums=('76ffe14b0bff703be3c5a6ebc0c390cb7941c26d14cca0da742d6ef3534e22b9')

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
