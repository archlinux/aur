# Maintainer: Sam  <dev at samarthj dot com>

# shellcheck disable=2034,2148,2154

pkgname=python-resolvelib-git
_pkgname=resolvelib
pkgver=0.8.1.r16.ga5ae681
pkgrel=1
pkgdesc="Resolve abstract dependencies into concrete ones"
url="https://github.com/sarugaku/$_pkgname"
license=('ISC')
arch=('any')
depends=('python>=3.6')
makedepends=('git' 'python-setuptools')
provides=("python-$_pkgname=$pkgver")
conflicts=("python-$_pkgname")
checkdepends=('python-commentjson' 'python-packaging' 'python-pytest-runner')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname" || exit 1
  ver=$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  echo "${ver#v}"
}

build() {
  cd "$srcdir/$_pkgname" || exit 1
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname" || exit 1
  python setup.py pytest
}

package() {
  cd "$srcdir/$_pkgname" || exit 1
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
