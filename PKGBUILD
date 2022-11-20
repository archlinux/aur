# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgname=python38-dateutil
pkgver=2.8.2
pkgrel=4
pkgdesc="Provides powerful extensions to the standard datetime module"
arch=('any')
license=('BSD' 'Apache')
url="https://github.com/dateutil/dateutil"
depends=('python38-six')
makedepends=('python38-setuptools-scm' 'python38-six' 'git')
checkdepends=('python38-pytest' 'python38-freezegun' 'python38-hypothesis')
source=(git+https://github.com/dateutil/dateutil.git#commit=6b035517571e63b6a63a493740c5506ec1e5da44?signed)
sha256sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') # Mario Corchero <mariocj89@gmail.com>

build() {
  cd "$srcdir"/dateutil
  python3.8 setup.py build
}

check() {
  cd dateutil
  pytest -W ignore::pytest.PytestUnknownMarkWarning # https://github.com/pytest-dev/pytest/issues/5678
}

package() {
  cd "$srcdir"/dateutil
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
