# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkg=gnews
pkgname=python-${_pkg}-git
pkgver=r172.a322163
pkgrel=2
pkgdesc='A library that provides an API to search for articles on Google News and returns a usable JSON response.'
arch=('any')
url=https://github.com/ranahaani/gnews
license=('MIT')
depends=('python' 'python-feedparser' 'python-beautifulsoup4' 'python-dnspython' 'python-requests')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('python-gnews')
conflicts=('python-gnews')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkg}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkg"
  python -m build --wheel --no-isolation
}


package() {
  cd "$_pkg"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:ts=2:sw=2:et:
