# Maintainer: Yen Chi Hsuan <yan12125 at gmail dot com>

_pkgname=python-hashpumpy
pkgname=$_pkgname-git
pkgver=v1.2.0.r4.g2d01d3b
pkgrel=1
pkgdesc=" A tool to exploit the hash length extension attack in various hashing algorithms"
arch=("i686" "x86_64")
url="https://github.com/bwall/HashPump"
license=('MIT')
makedepends=('git')
depends=('openssl' 'python')
provides=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/bwall/HashPump")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --skip-build --root="${pkgdir}"

    install -Dm755 -d "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/"
}

