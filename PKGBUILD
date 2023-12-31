# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname=python-regex-git
pkgver=431.4f2ed52
pkgrel=1
pkgdesc="Alternative regular expression module, to replace re."
arch=('i686' 'x86_64')
url="https://github.com/mrabarnett/mrab-regex"
license=('custom')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
_gitname='mrab-regex'
source=("git+https://github.com/mrabarnett/mrab-regex")
md5sums=('SKIP')
provides=(python-regex)
conflicts=(python-regex)


pkgver() {
  cd ${_gitname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd ${_gitname}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_gitname}
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  python -m installer --destdir="$pkgdir" dist/*.whl
}
