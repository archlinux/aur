# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=wllvm-git
pkgver=r461.6d8955b
pkgrel=1
pkgdesc="A wrapper script to build whole-program LLVM bitcode files"
arch=('any')
url="https://github.com/travitch/whole-program-llvm"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("$pkgname"::'git+https://github.com/travitch/whole-program-llvm.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
