# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Gerardo Marset <gammer1994@gmail.com>

pkgname=lci-git
_pkgurl=git://github.com/justinmeza/lci.git

# Set this to true for the 1.4 draft (fileio, sockets, bukkits, …):
_usedraft=false

if test "$_usedraft" == "true"; then
    # 1.4 draft:
    _pkgurl=$_pkgurl#branch=future
fi

pkgver=0.10.5.r27.g6762b72
pkgrel=1
pkgdesc="A simple and fast 1.2 lolcode interpreter written in C."
arch=('i686' 'x86_64')
url="https://lolcode.org/"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'cmake')
optdepends=('gtksourceview-lolcode: syntax highlight')
# provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::${_pkgurl}")
sha512sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${pkgname%-git}" || exit
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
	cd "${srcdir}/${pkgname%-git}" || exit
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
#	make docs	
}

#check()
#{
#	cd "$srcdir/$pkgname"
#	ctest
#}

package()
{
	cd "${srcdir}/${pkgname%-git}" || exit
	make DESTDIR="${pkgdir}" install
}
