# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='certbot-dns-duckdns'
_pkgverUpstream="1.10.0"
pkgver="$_pkgverUpstream"
pkgrel=1
pkgdesc="Plugin for certbot for a DNS-01 challenge with a DuckDNS domain"
arch=('any')
url='https://github.com/infinityofspace/certbot_dns_duckdns'
license=('MIT')
depends=('certbot' 'python-dnspython' 'python-requests')
makedepends=( 'python-build' 'python-installer' 'python-setuptools' )
source=("https://github.com/infinityofspace/certbot_dns_duckdns/archive/refs/tags/v${_pkgverUpstream}.tar.gz")
sha384sums=('3b13c3d5d145e87497963d797b8ae9f4fdbb1ab256ca2545f4b400e95e6eac11b5cca14e122ef6cd0e41f0f54a72096a')

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
