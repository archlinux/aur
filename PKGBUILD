# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=mutagen-git
pkgdesc="An audio metadata tag reader and writer, mercurial version"
license=('GPL2')
url="https://github.com/quodlibet/mutagen"
pkgver=1571.cb363c1
pkgrel=2

conflicts=('mutagen' 'python-mutagen')
provides=('mutagen' 'python-mutagen')

source=("$pkgname::git+$url.git")
md5sums=('SKIP')
depends=('python-setuptools')
makedepends=('git')
arch=('any')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"

    python setup.py install --skip-build \
                            --optimize=1 \
                            --prefix=/usr \
                            --root="${pkgdir}"
}
