# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Old Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
 
pkgname=python-cairo-git
pkgver=1.10.1.34.5a45b0b
pkgrel=1
pkgdesc="Python bindings for the cairo graphics library. Git version."
url="http://www.cairographics.org/"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('python' 'cairo>=1.12')
makedepends=('git' 'pkg-config')
options=('!libtool')
provides=("python-cairo=1.10.0")
conflicts=('python-cairo')
source=("${pkgname}::git://git.cairographics.org/git/pycairo")
md5sums=('SKIP')
 
pkgver() {
    cd ${srcdir}/${pkgname}
    PREFIX="pycairo_version        = '"
    ver=$(grep "$PREFIX" setup.py | sed "s/$PREFIX//" | sed "s/'//")
    revision=$(git rev-list --count HEAD)
    hash=$(git log --pretty=format:'%h' -n 1)
    echo $ver.$revision.$hash
}
 
package() {
    cd ${srcdir}/${pkgname}
    python3 setup.py install --root=${pkgdir}/ --optimize=1
}
 
# vim:set ts=4 sw=4 et:
