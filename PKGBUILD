# Maintainer: neeshy <neeshy@tfwno.gf>
_pkgname=imbpy
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
pkgdesc="A python interface for imageboards"
arch=('any')
url="https://gitgud.io/ring/imbpy"
license=('custom:ISC')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://gitgud.io/ring/imbpy.git"
        "setup.py.patch")
sha256sums=('SKIP'
            '5a8b4cdbb45085432cde21214df787f6380742abc3b67ba913763ce8659ce47e')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 -i "$srcdir/setup.py.patch"
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
