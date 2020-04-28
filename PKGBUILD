# Maintainer: Pochang Chen <johnchen902@gmail.com>

pkgname=python-nclib-git
_name=nclib
pkgver=r80.8c77802
pkgrel=1
pkgdesc="Netcat as a library"
license=("MIT")
arch=('any')
url="https://github.com/rhelmot/nclib"
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/rhelmot/nclib.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/nclib"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir"/nclib
    python setup.py build
}

package() {
    depends=('python')
    conflicts=('python-nclib')
    provides=('python-nclib')
    cd "$srcdir"/nclib
    python setup.py install -O1 --root="$pkgdir"
    install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
