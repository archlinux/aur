# Maintainer: XZS <d dot f dot fischer at web dot de>
pkgver=1.1.0
pkgname=python-path-and-address-git
pkgrel=1
pkgdesc="Functions for server CLI applications used by humans."
arch=('any')
url="https://github.com/joeyespo/path-and-address"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
md5sums+=('SKIP')
provides+=("$_gitname=$pkgver")
conflicts+=("$_gitname")

pkgver() {
  cd "$_gitname"
  grep -Po "(?<=version=').*(?=',)" setup.py | tr '\n' '.'
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
