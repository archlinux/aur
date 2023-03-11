# Maintainer: Paco Pascal <me@pacopascal.com>

_checkoutdir='guile-git'
_pkgname=guile-git-lib
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
pkgdesc='Guile-Git is a GNU Guile library providing bindings to libgit3. (git repo)'
arch=('any')
url='https://gitlab.com/guile-git/guile-git'
license=('GPL3')
options=('!strip')
depends=('guile' 'guile-bytestructures' 'libgit2')
makedepends=('autoconf' 'automake' 'pkg-config')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://gitlab.com/guile-git/guile-git.git')
md5sums=('SKIP')

prepare() {
    cd "$_checkoutdir"
    aclocal
    autoconf
    automake --add-missing
}

build() {
    cd "$_checkoutdir"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$_checkoutdir"
    make DESTDIR="${pkgdir}" install
}
