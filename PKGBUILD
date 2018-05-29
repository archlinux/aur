# Maintainer: jun7 <jun7@hush.com>
pkgname=wyebab-git
pkgver=1.1
pkgrel=1
pkgdesc="An adblock command using the easylist.txt."
arch=('x86_64')
url="https://github.com/jun7/wyebadblock"
license=('GPL3')
depends=('glib2')
conflicts=('wyebadblock-git')
makedepends=('git')
_branch=master
source=("git://github.com/jun7/wyebadblock.git#branch=$_branch")
md5sums=('SKIP')

pkgver(){
	cd "$srcdir/wyebadblock"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/wyebadblock"
	git pull --rebase origin $_branch
	make clean
}

build() {
	cd "$srcdir/wyebadblock"
	DEBUG=0
	make wyebab
}

package() {
	cd "$srcdir/wyebadblock"
	install -Dm755 wyebab     "$pkgdir/usr/bin/wyebab"
}
