# Maintainer: Austin Howard <austin1howard@gmail.com>
pkgname=teeproxy # '-bzr', '-git', '-hg' or '-svn'
pkgver=r36.1e7b547
pkgrel=3
pkgdesc="teeproxy from chrislusf"
arch=('i686' 'x86_64')
url="https://github.com/chrislusf/teeproxy"
license=('Apache')
groups=()
depends=()
makedepends=('git' 'go')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/chrislusf/teeproxy.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
#	cd "$srcdir/${pkgname%-VCS}"
#	patch -p1 -i "$srcdir/${pkgname%-VCS}.patch"
#}

build() {
	cd "$srcdir/${pkgname%}"
	go build
}

#check() {
	#cd "$srcdir/${pkgname%-VCS}"
	#make -k check
#}

package() {
	cd "$srcdir/${pkgname%}"
	#make DESTDIR="$pkgdir/" install
	mkdir -p $pkgdir/usr/bin
	cp teeproxy $pkgdir/usr/bin
}
