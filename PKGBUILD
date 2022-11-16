# Maintainer: Keyboard Slayer <github.com/keyboard-slayer>
# Maintainer: Monax (SMNX) <github.com/sleepy-monax>

pkgname=devse-osdk-git
pkgver=r30.18aa5a8
pkgrel=1
pkgdesc="An operating system development kit."
arch=('any')
url="https://github.com/devse-org/osdk"
license=('MIT')
depends=('python' 'ninja' 'python-requests')
makedepends=('git' 'python-setuptools')
optdepends=('clang: for compiling C/C++ code'
            'llvm: tools for C/C++ development'
            'ld.lld: for linking'
            'nasm: for compiling assembly code')
source=("${pkgname}::git+https://github.com/devse-org/osdk.git")
sha256sums=('SKIP')
provides=('devse-osdk')
conflicts=('devse-osdk')

pkgver() {
    cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	export PYTHONHASHSEED=0
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
}
