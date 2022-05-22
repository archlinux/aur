#Maintainer: The Fairy Glade
#Contributor: KR1470R <vartus2@gmail.com>
pkgname="ly-aur"
pkgver=v0.5.3.41
pkgrel=1
pkgdesc="TUI Display Manager"
arch=("any")
makedepends=("git")
url="https://github.com/fairyglade/ly.git"
source=("git+$url")
license=('WTFPL')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./g'
}

prepare() {
	cd "$pkgname"
	git submodule init
	git config ly-aur.sub.url "$srcdir/sub"
	git submodule update
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
