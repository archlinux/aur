# Maintainer: Paco Pascal <me@pacopascal.com>

_checkoutdir='guile-git'
_pkgname=guile-git-lib
pkgname="$_pkgname-git"
pkgver=r318.e709df0
pkgrel=1
pkgdesc='Guile-Git is a GNU Guile library providing bindings to libgit3. (git repo)'
arch=('x86_64')
url='https://gitlab.com/guile-git/guile-git'
license=('GPL3')
options=('!strip')
depends=('guile' 'guile-bytestructures' 'libgit2')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://gitlab.com/guile-git/guile-git.git')
md5sums=('SKIP')

pkgver() {
    # Number of revisions since beginning of the history.
    cd "${_checkoutdir}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${_checkoutdir}"
    aclocal
    autoconf
    automake --add-missing
}

build() {
    cd "${_checkoutdir}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${_checkoutdir}"
    make DESTDIR="${pkgdir}" install
}
