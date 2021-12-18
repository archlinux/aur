# Maintainer: Claudio Kozický <claudiokozicky@gmail.com>

pkgname=beets-extrafiles-git
pkgver=0.0.7.r2.ga1d6ef9
pkgrel=4
pkgdesc="A plugin for beets that copies additional files and directories during the import process."
arch=('any')
url="https://github.com/Holzhaus/beets-extrafiles"
license=('MIT')
depends=('beets' 'python-mediafile')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Holzhaus/${pkgname%-git}.git")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py build
}

check() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py test
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --optimize=1 --root="$pkgdir" --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
