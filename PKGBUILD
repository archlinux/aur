# Maintainer: steffeno <steffeno dash etc at protonmail dot com>

pkgname=python-randcrack-git
pkgver=0.1.5.r28.6b8d738
pkgrel=1
pkgdesc='Python random module cracker / predictor'
arch=('any')
url='https://github.com/tna0y/Python-random-module-cracker'
license=('MIT')
makedepends=('git' 'python-setuptools' 'python-pip')
depends=('python')
source=("$pkgname"::"git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "%s.r%s.%s" \
        "$(grep 'version' setup.py | head -n 1 | cut -d\' -f2)" \
        "$(git rev-list --count HEAD)"  \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    python3 setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
