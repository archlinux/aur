# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="certbot-dns-porkbun"
pkgver=0.11.0
pkgrel=1
pkgdesc="Plugin for certbot to obtain certificates using a DNS TXT record for Porkbun domains"
arch=("any")
license=("MIT")
url="https://github.com/infinityofspace/certbot_dns_porkbun"
depends=("certbot>=1.18.0"
         "python-dnspython"
         "python-pkb-client"
         "python-requests"
         "python-tldextract")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://github.com/infinityofspace/certbot_dns_porkbun/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7bc3f96d059d5cbb6433346f7b641b34e1cf5b3b855edba806cc320d9dda8dc4b8c042308ada0a7d5f3cf6a0c6c713f7f8eaa0829180188162ee3b8cefb8444b')

build(){
 cd "certbot_dns_porkbun-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "certbot_dns_porkbun-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 find "$pkgdir/usr/lib" -type d -path "*/site-packages/tests" -exec rm -rf {} +
}
