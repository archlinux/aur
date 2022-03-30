# Maintainer: jun7 <jun7@hush.com>
pkgname=wyebadblock-git
pkgver=1.1
pkgrel=7
pkgdesc="An adblock extension for webkit2gtk browsers."
arch=('x86_64')
provides=('wyebab-git')
url="https://github.com/jun7/wyebadblock"
license=('GPL3')
depends=('webkit2gtk')
makedepends=('git')
_branch=master
source=("git+https://github.com/jun7/wyebadblock.git#branch=$_branch")
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
	make
}

package() {
	cd "$srcdir/wyebadblock"
	install -Dm755 wyebab     "$pkgdir/usr/bin/wyebab"
	install -Dm755 adblock.so "$pkgdir/usr/lib/wyebrowser/adblock.so"
}
