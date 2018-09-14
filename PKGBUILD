# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

_pkgname=python-hashpumpy
pkgname=$_pkgname-git
pkgver=1.2.0.r8.g314268e
pkgrel=1
pkgdesc=" A tool to exploit the hash length extension attack in various hashing algorithms"
arch=("i686" "x86_64")
url="https://github.com/bwall/HashPump"
license=('MIT')
makedepends=('git')
depends=('openssl' 'python')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/bwall/HashPump")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd $_pkgname
    python setup.py build
}

check() {
    cd $_pkgname

    export PYTHONPATH="$(pwd)/build/lib.linux-$CARCH-3.7:$PYTHONPATH"
    python test.py
}

package() {
    cd $_pkgname

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

