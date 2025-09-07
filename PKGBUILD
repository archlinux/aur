# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-i2c-git
pkgver=0.1.2.r0.g05b79c0
pkgrel=1
pkgdesc="I2C modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-i2c"
license=('MIT')
depends=('python-cocotb')
provides=('python-cocotbext-i2c')
conflicts=('python-cocotbext-i2c')
makedepends=('git' 'python-setuptools')

_gitroot='https://github.com/alexforencich/cocotbext-i2c.git'
_gitname='cocotbext-i2c'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_gitname"
    python setup.py build
}

package() {
    cd "$srcdir/$_gitname"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
