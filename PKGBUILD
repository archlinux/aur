# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='certbot-dns-duckdns'
_pkgverUpstream="1.6"
pkgver="1.6.0"
pkgrel=1
pkgdesc="Plugin for certbot for a DNS-01 challenge with a DuckDNS domain"
arch=('any')
url='https://github.com/infinityofspace/certbot_dns_duckdns'
license=('MIT')
depends=('certbot' 'python-dnspython' 'python-requests')
makedepends=( 'python-build' 'python-installer' 'python-wheel' )
source=("https://github.com/infinityofspace/certbot_dns_duckdns/archive/refs/tags/v${_pkgverUpstream}.tar.gz")
sha256sums=('2dd20ab0a76ecdf2657a978ce9329a2acefe0c5df29d739920e43b00aa0ab809')

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
