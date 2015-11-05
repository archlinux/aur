# Maintainer: Maxime Arthaud <maxime@arthaud.me>

pkgname=python-formatstring-git
pkgver=1.1.r0.g321baf7
pkgrel=1
pkgdesc="Format string exploitation helper"
arch=('any')
url="https://github.com/arthaud/formatstring"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
optdepends=('python-pyelftools: infer the architecture from a binary file')
source=("$pkgname::git://github.com/arthaud/formatstring.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install -f --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
