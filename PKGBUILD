pkgname=yup-git
basepkgname=yup
pkgver=v0.1.8.beta.r1.gb764aa8
pkgrel=1
pkgdesc="Ncurses based AUR Helper with improved searching and sorting"
arch=('any')
url="https://github.com/ericm/yup"
license=('GPL3')
depends=('pacman>=5.1' 'git' 'ncurses' 'sudo')
makedepends=('go')
provides=("$basepkgname")
conflicts=("$basepkgname")
source=('git+https://github.com/ericm/yup.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$basepkgname"
 	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$basepkgname"
	make prefix=/usr
}

package() {
	cd "$srcdir/$basepkgname"
	install -Dm755 "$basepkgname" "$pkgdir/usr/bin/$basepkgname"
	install -Dm755 completions/zsh \
		"$pkgdir/usr/share/zsh/site-functions/completions/_$basepkgname"
}
