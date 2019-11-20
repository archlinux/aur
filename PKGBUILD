# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Gerardo Marset <gammer1994@gmail.com>

pkgname=lci-git

# Set this to true for the 1.4 draft (fileio, sockets, bukkits, …):
_usedraft=false
_pkgurl="git+https://github.com/justinmeza/lci.git"

if test "$_usedraft" == "true"; then
    # 1.4 draft:
    _pkgurl="$_pkgurl#branch=future"
fi

pkgver=0.10.5.r27.g6762b72
pkgrel=1
pkgdesc="A simple and fast 1.2 lolcode interpreter written in C."
arch=('i686' 'x86_64')
url="https://lolcode.org/"
license=('GPL3')
depends=('glibc' 'readline')
makedepends=('git' 'cmake')
optdepends=('gtksourceview-lolcode: syntax highlight')
# provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::$_pkgurl")
sha512sums=('SKIP')

pkgver()
{
    cd "$pkgname" || exit
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
    cd "$pkgname" || exit
    cmake -DCMAKE_INSTALL_PREFIX=/usr
    make
    # make docs
}

# check()
# {
#     cd "$pkgname"
#     ctest
# }

package()
{
    cd "$pkgname" || exit
    make DESTDIR="$pkgdir" install
}
