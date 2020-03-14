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
source=("git+https://gitgud.io/ring/imbpy"
        "setup.py.patch")
sha256sums=('SKIP'
            '4fc94e7c2dd2eebf135b76dbb2e3044fad688249f08bde8c28fe72a6e7785eba')

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
