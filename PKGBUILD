# Maintainer: Thomas Heinemann <thomas@nipha.de>

pkgname=parsedmarc
pkgver=6.12.0
_commit=3f1e25e315ae4bf7b309a75f89bc6648cc0a81b4 # Untagged release
pkgrel=1
pkgdesc='Python package and CLI for parsing aggregate and forensic DMARC reports'
arch=(any)
url=https://domainaware.github.io/parsedmarc
license=(Apache)
depends=('python-tqdm>=4.31.1'
         'rstcheck>=3.3.1'
         python-pygments
         'python-dnspython>=2.0.0'
         'python-expiringdict>=1.1.4'
         'python-urllib3>=1.25.7'
         'python-requests>=2.22.0'
         'python-publicsuffix2>=2.20190812'
         'python-xmltodict>=0.12.0'
         'python-geoip2>=3.0.0'
         'python-imapclient>=2.1.0'
         'python-dateparser>=0.7.2'
         'python-elasticsearch-dsl>=7.2.0'
         'python-kafka>=1.4.4'
         'python-mailsuite>=1.6.1'
         'python-nose>=1.3.7'
         'flake8>=3.7.8'
         'python-doc8>=0.8.0'
         'python-collective-checkdocs>=0.2'
         'python-jinja>=2.10.1'
         'python-packaging>=19.1'
         'python-imagesize>=1.1.0'
         'python-sphinx-alabaster-theme>=0.7.12'
         'python-babel>=2.7.0'
         'python-sphinx>=1.0.5'
         'python-sphinx_rtd_theme>=0.4.3'
         'python-wheel>=0.33.6'
         'python-codecov>=2.0.15'
         'python-lxml>=4.4.0')
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::https://github.com/domainaware/parsedmarc/archive/$_commit.tar.gz)
sha512sums=('964564087bbc88bd6ff8516f8c7f15e853cc43dc153ffe78f122a9696f387c7dc0eae7de3486083693d67c4cf886767b2e9ffbe2a431ce573de549510132af6d')

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
