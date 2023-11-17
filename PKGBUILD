# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thomas Heinemann <thomas@nipha.de>

pkgname=parsedmarc
pkgver=8.6.4
pkgrel=1
pkgdesc='Python package and CLI for parsing aggregate and forensic DMARC reports'
arch=(any)
url=https://domainaware.github.io/parsedmarc
license=(Apache)
depends=('mailparser' 'python-xmltodict' 'python-expiringdict' 'python-lxml'
'python-mailsuite' 'python-azure-core' 'python-azure-identity'
'python-msgraph-core' 'python-google-api-core' 'python-google-auth-oauthlib'
'python-google-api-python-client' 'python-dateutil' 'python-geoip2'
'python-publicsuffixlist' 'python-tqdm' 'python-elasticsearch-dsl' 'python-kafka'
'python-boto3' 'python-azure-monitor-ingestion')
makedepends=('python-build' 'python-hatchling' 'python-installer')
source=("https://pypi.io/packages/source/p/parsedmarc/parsedmarc-${pkgver}.tar.gz")
sha512sums=('85e46f4478925e4dba67e8d559f89131d1ca1709c11464fc86adcf72497ff0585e45f2cf27d7fe8cf69b095010a48c3fe412da733bc11c16a0d3abb60b69c936')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
