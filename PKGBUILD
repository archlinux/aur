# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-mailsuite
pkgver=1.2.1
_commit=4f87324970a0340107ab96639596b67493e96244 # Upstream does not tag releases - cherry-pick is release version plus updated documentation
pkgrel=1
pkgdesc='Python package to make receiving, parsing, and sending email easier'
arch=(any)
url=https://seanthegeek.github.io/mailsuite/
license=(Apache)
depends=('python-imapclient>=2.1.0'
         'mailparser>=3.9.3'
         'python-dnspython>=1.16.0'
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
source=($pkgname-$pkgver.tar.gz::https://github.com/seanthegeek/mailsuite/archive/$_commit.tar.gz)
sha512sums=('9f95702c6cb0a25262e6243e307b04bc901b45665083d8bbbbbb56336817f501a4f0af207269bda6f9eb8995e4e69852c6d75f31d744a4e3c373f30916cde961')

build() {
  cd mailsuite-$_commit
  python setup.py build

  cd docs
  make man
}

package() {
  cd mailsuite-$_commit
  python setup.py install --root="$pkgdir" -O1
  install -Dm 644 docs/_build/man/mailsuite.1 -t "$pkgdir"/usr/share/man/man1
  install -Dm 644 README.rst -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
