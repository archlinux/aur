# Maintainer: Shae VanCleave <shae.m.vc@proton.me>

_pkgname='python-cfile'
pkgname="$_pkgname-git"
provides=("$_pkgname")
conflicts=("$_pkgname")
pkgdesc='C code generator for Python'
url='https://github.com/cogu/cfile'
license=('MIT')

pkgver=0.4.0.r1.g7ed5d25
pkgrel=1

arch=('any')
depends=('python>=3.10')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
optdepends=()

source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')


prepare() {
    git -C "$srcdir/$_pkgname" clean -dfx
}

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
    install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md" CHANGELOG.md
}
