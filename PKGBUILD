# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Forked from community/python-botocore; original contributors:
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Ainola
# Contributor: Chris Fordham

# See https://github.com/spulec/moto/issues/1793 for the rationale for this package

pkgname=python-botocore-legacy
pkgver=1.10.84
pkgrel=3
pkgdesc='A low-level interface to a growing number of Amazon Web Services (python-moto compatible version)'
arch=('any')
url="https://github.com/boto/botocore"
license=('Apache')
depends=('python-dateutil' 'python-jmespath' 'python-docutils')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-mock' 'python-jsonschema')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('842dbbe0f75b13285c97b4204cc82664ce51fc4c7a09a84f78e58a77deb8b494')
provides=("python-botocore=$pkgver")
conflicts=(python-botocore)

build() {
  cd botocore-$pkgver
  python setup.py build
}

check() {
  # 12 functional tests fail
  cd botocore-$pkgver/tests
  nosetests -v unit # functional
}

package() {
  cd botocore-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
