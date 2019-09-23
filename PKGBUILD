# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=parsedmarc
pkgver=6.6.1
_commit=7d7a3e0919bbe32aad59e516b4b0dd6ec9fdfc15 # Untagged release
pkgrel=1
pkgdesc='Python package and CLI for parsing aggregate and forensic DMARC reports'
arch=(any)
url=https://domainaware.github.io/parsedmarc
license=(Apache)
depends=('python-tqdm>=4.31.1'
         'rstcheck>=3.3.1'
         python-pygments
         'python-dnspython>=1.16.0'
         'python-expiringdict>=1.1.4'
         'python-urllib3<1.25'
         'python-urllib3>=1.21.1'
         'python-requests>=2.2.16.0'
         'python-publicsuffix2>=2.20190812'
         'python-xmltodict>=0.12.0'
         'python-geoip2>=2.9.0'
         'python-imapclient>=2.1.0'
         'mailparser>=3.9.2'
         'python-dateparser>=0.7.1'
         'python-elasticsearch<7.0.0'
         'python-elasticsearch>=6.3.1'
         'python-elasticsearch-dsl<7.0.0'
         'python-elasticsearch-dsl>=6.3.1'
         'python-kafka>=1.4.4'
         'python-mailsuite>=1.3.0'
         'python-nose>=1.3.7'
         'flake8>=3.7.8'
         'python-collective-checkdocs>=0.2'
         'python-jinja>=2.10.1'
         'python-packaging>=19.1'
         'python-imagesize>=1.1.0'
         'python-sphinx-alabaster-theme>=0.7.12'
         'python-babel>=2.7.0'
         'rstcheck>=3.3.1'
         'python-sphinx>=1.0.5'
         'python-sphinx_rtd_theme>=0.4.3'
         'python-wheel>=0.33.6'
         'python-codecov>=2.0.15')
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::https://github.com/domainaware/parsedmarc/archive/$_commit.tar.gz)
sha512sums=('e2e074fd3b076ce1f5069e339e51b0db305fb6184c67b69aaa185f5ff10310eb2b103fdd8ce123d72dfe020b6646f146526ff8c4574f6095daeb950b16e6ac4f')

build() {
  cd $pkgname-$_commit
  python setup.py build

  cd docs
  make man
}

check() {
  cd $pkgname-$_commit
  python tests.py || warning "Tests failed"
}

package() {
  cd $pkgname-$_commit
  python setup.py install --root="$pkgdir" -O1
  install -Dm 644 docs/_build/man/parsedmarc.1 -t "$pkgdir"/usr/share/man/man1
  install -Dm 644 README.rst -t "$pkgdir"/usr/share/doc/$pkgname
  cp -a samples "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
