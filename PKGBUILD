# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="certbot-dns-porkbun"
pkgver=0.9.1
pkgrel=2
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
b2sums=('a193d5f7f924500386761844256cc7d9c890961bb78c9f67a76de832375afe0f33ea2e741a22aa141f8774d27977c2337ec4304e3bf037f99c6e34bf31639035')

build(){
 cd "certbot_dns_porkbun-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "certbot_dns_porkbun-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 find "$pkgdir/usr/lib" -type d -path "*/site-packages/tests" -exec rm -rf {} +
}
