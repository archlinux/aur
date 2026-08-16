# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='certbot-dns-duckdns'
_pkgverUpstream="1.9.0"
pkgver="$_pkgverUpstream"
pkgrel=1
pkgdesc="Plugin for certbot for a DNS-01 challenge with a DuckDNS domain"
arch=('any')
url='https://github.com/infinityofspace/certbot_dns_duckdns'
license=('MIT')
depends=('certbot' 'python-dnspython' 'python-requests')
makedepends=( 'python-build' 'python-installer' 'python-setuptools' )
source=("https://github.com/infinityofspace/certbot_dns_duckdns/archive/refs/tags/v${_pkgverUpstream}.tar.gz")
sha384sums=('60662ca2f8b01e6ec289c72c089eb917083036614125da48ba6731ed502df62806773f4cd4b83de9707a5d0592c5788e')

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
