# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=swaystatus-git
pkgver=0.2.2.r6.f8e7b2c
pkgrel=1
pkgdesc="Generates a status line for swaybar"
arch=('any')
url="https://gitlab.com/jmcantrell/${pkgname%-git}"
license=('GPL3')
depends=('python' 'python-schema' 'python-toml' 'python-setuptools')
makedepends=('git')
checkdepends=('python-pytest' 'python-pytest-cov')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

check() {
    cd "$srcdir/${pkgname%-git}"
    PYTHONPATH=$PWD/src pytest --no-cov
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir" --optimize=1
}
