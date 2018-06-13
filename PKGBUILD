# Maintainer: Will Haines <w@willhaines.me>
pkgname="python-pythonnet"
pkgver=2.3.0.r110.g397b0b4
pkgrel=1
pkgdesc="pythonnet provides integration with the .NET Common Language Runtime (CLR)"
arch=(any)
url="https://pythonnet.github.io/"
license=("MIT")
depends=("python" "mono")
makedepends=("nuget" "git" "python-wheel")
provides=("python-pythonnet")
source=("git+https://github.com/pythonnet/pythonnet.git")
md5sums=('SKIP')

pkgver () {
    cd "$srcdir/pythonnet"
    git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

build () {
    cd "$srcdir/pythonnet"
    # workaround for https://github.com/pythonnet/pythonnet/issues/654
    touch tools/geninterop/fake_libc_include/crypt.h
    python setup.py bdist_wheel
}

package () {
    cd "$srcdir/pythonnet"
    pip install --no-index --find-links=./dist/ --root="$pkgdir/" --prefix="/usr" pythonnet
}
