# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=mutagen-git
pkgdesc="An audio metadata tag reader and writer, mercurial version"
license=('GPL2')
url="https://github.com/quodlibet/mutagen"
pkgver=1479.b15f1f4
pkgrel=1

conflicts=('mutagen')
provides=('mutagen')

source=("$pkgname::git+$url.git")
md5sums=('SKIP')
depends=('python-setuptools')
makepends=('git')
arch=('any')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$srcdir/$pkgname"

    python setup.py install --root="${pkgdir}"
    install -d "${pkgdir}/usr/bin"
    install -m755 tools/* "${pkgdir}/usr/bin"
}
