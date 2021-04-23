# Maintainer: Heiko Nickerl <dev at heiko-nickerl dot com>
_name=npyscreen
pkgname=python-$_name-git
pkgver=r494.8ce3120
pkgrel=2
pkgdesc="A python widget library and application framework"
arch=('any')
url="https://github.com/npcole/npyscreen"
license=('BSD')
conflicts=('python-npyscreen')
provides=('python-npyscreen')
makedepends=('git' 'python-setuptools' )
depends=('python' )
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_name"
    python setup.py build
}

package() {
    cd "$srcdir/$_name"
    install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/python-$_name/LICENSE
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
