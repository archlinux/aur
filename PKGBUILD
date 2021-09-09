# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: Mufeed Ali <fushinari@protonmail.com>

pkgname=python-googletrans-git
_author=ssut
_gitname=py-googletrans
pkgver=r116.d15c94f
pkgrel=1
pkgdesc="Free Google Translate API for Python. Git version."
arch=('any')
license=('MIT')
url="https://github.com/ssut/py-googletrans"
depends=(
  python-httpx
  python-h2
)
optdepends=('python-hyper: faster http networking')
makedepends=(
  python-setuptools
  git
)
provides=('python-googletrans')
conflicts=('python-googletrans')
source=("git+https://github.com/$_author/$_gitname.git")
sha512sums=('SKIP')

prepare() {
  cd ${srcdir}/$_gitname
  sed -i 's|httpx==|httpx>=|' setup.py
}

pkgver() {
  cd "$_gitname"
  printf 'r%s.%s' \
      "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  python setup.py build
}

package() {
  cd "$_gitname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

