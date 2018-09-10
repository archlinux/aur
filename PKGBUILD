# Maintainer: Stephan Springer <buzo+arch@Lini.de>

_pkgname=aurblobs
pkgname="$_pkgname-git"
pkgver=r80.2dfcc20
pkgrel=1
pkgdesc='Automatically build AUR packages and serve them from a repository (git version)'
arch=('any')
url='https://github.com/aurblobs/aurblobs'
license=('AGPL3')
makedepends=('git' 'python-setuptools')
depends=('python-click' 'python-docker' 'python-gitpython' 'git'
         'python-pretty_bad_protocol' 'python-xdg')
source=("git+https://github.com/$_pkgname/$_pkgname.git"
       'fix-constants.diff')
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$_pkgname/"
    printf "r%s.%s" \
           "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname/"
    patch -p2 -i "$srcdir"/fix-constants.diff
}

build() {
    cd "$_pkgname"
    python setup.py build
}

package() {
    cd "$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1
}
