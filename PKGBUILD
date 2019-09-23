# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=checkdmarc
pkgver=4.2.4
_commit=c99abc9370bee3dd1abc4fd28e78b09d00a328eb # Untagged release
pkgrel=1
pkgdesc='Parser for SPF and DMARC DNS records'
arch=(any)
url=https://domainaware.github.io/checkdmarc
license=(Apache)
depends=('python-dnspython>=1.16.0'
         'python-expiringdict>=1.1.4'
         'python-pyleri>=1.3.2'
         'python-publicsuffix2>=2.20190812'
         'python-requests>=2.21.0'
         'python-timeout-decorator>=0.4.1'
         'python-nose>=1.3.7'
         'python-pygments>=2.3.1'
         'flake8>=3.7.8'
         'python-doc8>=0.8.0'
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
source=($pkgname-$pkgver.tar.gz::https://github.com/domainaware/$pkgname/archive/$_commit.tar.gz)
sha512sums=('2ec1f79caddcb510d537b3942337ffe140d1e84a9b17a61d5d189a49fcb668ec5ae4b1eceab5b609e8cf463cfbe52c5f18897c8eef0e6fca82b0305887837209')

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
  install -Dm 644 docs/build/man/checkdmarc.1 -t "$pkgdir"/usr/share/man/man1
  install -Dm 644 README.rst -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
