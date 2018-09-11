# Maintainer: Stephan Springer <buzo+arch@Lini.de>

_pkgname=aurblobs
pkgname="$_pkgname-git"
pkgver=r81.93ec861
pkgrel=1
pkgdesc='Automatically create binary repositories from AUR packages'
arch=('any')
url='https://github.com/aurblobs/aurblobs'
license=('AGPL3')
makedepends=('python-setuptools')
depends=('python-click' 'python-docker' 'python-gitpython' 'git'
         'python-pretty_bad_protocol' 'python-xdg')
source=("git+https://github.com/$_pkgname/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" \
           "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    python setup.py build
}

package() {
    cd "$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1
}
