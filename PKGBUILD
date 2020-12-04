# Maintainer Etienne Brateau <etienne dot brateau at gmail dot com>
# Contributor Kyle Laker <kyle at laker dot email>

pkgname=python-botocore-v2-git
pkgver=r7659.1a4caa8d1
pkgrel=1
pkgdesc="A low-level interface to a growing number of Amazon Web Services v2"
arch=('any')
url="https://github.com/boto/botocore"
license=('Apache')
depends=('python-jmespath' 'python-docutils' 'python-dateutil' 'python-urllib3')
provides=('python-botocore')
conflicts=('python-botocore')
makedepends=('git' 'python-setuptools')
source=("botocore-v2::git+$url#branch=v2")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/botocore-v2"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/botocore-v2"
  python setup.py build
}

package() {
  cd "$srcdir/botocore-v2"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
