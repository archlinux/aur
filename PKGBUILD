# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-pcie-git
pkgver=0.1.2.r1.gd9d461a
pkgrel=1
pkgdesc="PCI express simulation framework for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-pcie"
license=('MIT')
depends=('python-cocotb' 'python-cocotbext-axi')
provides=('python-cocotbext-pcie')
conflicts=('python-cocotbext-pcie')
makedepends=('git' 'python-setuptools')

_gitroot='https://github.com/alexforencich/cocotbext-pcie.git'
_gitname='cocotbext-pcie'

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
