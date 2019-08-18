# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=checkdmarc
pkgver=4.2.1
_commit=5147834805841593ab217a92044e0aceb6b92a08
pkgrel=1
pkgdesc='Parser for SPF and DMARC DNS records'
arch=(any)
url=https://domainaware.github.io/checkdmarc
license=(Apache)
depends=('python-dnspython>=1.16.0'
         python-expiringdict
         python-pyleri
         python-publicsuffix2
         python-requests
         python-timeout-decorator
         python-nose
         python-pygments
         flake8
         python-doc8
         python-collective-checkdocs
         python-jinja
         python-packaging
         python-imagesize
         python-sphinx-alabaster-theme
         python-babel
         'rstcheck>=3.3.1'
         python-sphinx
         python-sphinx_rtd_theme
         python-wheel
         python-codecov)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::https://github.com/domainaware/$pkgname/archive/$_commit.tar.gz)
sha512sums=('f5d4ed8171a5900e840abaea2cf0f6989f2bb63f6b3520f4352b0381b265024a0f2892b0a8f2f2ea7f27d4a9853998fc48aa40565a94a17d6d10c17944005067')

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
