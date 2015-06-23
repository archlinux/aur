# Maintainer: Vojtech Kral <vojtech_kral^hk>

pkgname='netresolve-git'
pkgver=r220.6f6d053
pkgrel=1
pkgdesc="Network name resolution library"
arch=('i686' 'x86_64')
url="http://www.sourceware.org/netresolve"
license=('BSD')
depends=('c-ares' 'unbound')
makedepends=('git')
source=(
	'git://sourceware.org/git/netresolve.git'
	'wrapper-paths.patch')
sha256sums=(
	'SKIP'
	'078bebb4e277a32df1b996f0b232661da19600b535d9624024578e73e18b0f85')

_gitname='netresolve'


pkgver()
{
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
	cd "${srcdir}/${_gitname}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${_gitname}"
	make DESTDIR="$pkgdir/" install
	cd "$pkgdir"
	patch -p0 < "$srcdir/wrapper-paths.patch"
}
