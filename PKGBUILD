pkgname=bgpstream-git
_pkgname=bgpstream
pkgver=r110.d4dfd92
pkgrel=1
pkgdesc="open-source software framework for live and historical BGP data analysis"
arch=('i686' 'x86_64')
url="https://bgpstream.caida.org"
license=('GPL')
depends=('libwandio>=1.0.3')
optdepends=('sqlite>=3.0.0: support for sqlite')
makedepends=('git')
provides=('bgpstream')
conflicts=('bgpstream')
source=("git+https://github.com/CAIDA/bgpstream.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

build() {
	cd "$_pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
