# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-mailsuite
pkgver=1.3.0
_commit=92dfacb8a4cd5f0fc6e0cd59d056d8aface4bef0 # Untagged release + changelog fix
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
sha512sums=('799a044de4e11906032acc94c67265a43314ad4eb07ab40feb1370e16c0a7125dbfb45b8967cd879270d663fc0139499dc19ea6833866cda8927193d36f66d99')

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
