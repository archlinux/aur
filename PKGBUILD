# Maintainer: jun7 <jun7@hush.com>
pkgname=wyeb-git
pkgver=1.1
pkgrel=4
pkgdesc="A vim-like webkit2gtk browser"
arch=('x86_64')
url="http://wyeb.org/"
license=('GPL3')
depends=('webkit2gtk' 'discount' 'perl-file-mimeinfo')
makedepends=('git')
_branch=master
source=("git+https://github.com/jun7/wyeb.git#branch=$_branch")
md5sums=('SKIP')

pkgver(){
	cd "$srcdir/wyeb"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/wyeb"
	git pull --rebase origin $_branch
	make clean
}

build() {
	cd "$srcdir/wyeb"
	make
}

package() {
	cd "$srcdir/wyeb"
	install -Dm755 wyeb   "$pkgdir/usr/bin/wyeb"
	install -Dm755 ext.so   "$pkgdir/usr/lib/wyebrowser/ext.so"
	install -Dm644 wyeb.png   "$pkgdir/usr/share/pixmaps/wyeb.png"
	install -Dm644 wyeb.desktop "$pkgdir/usr/share/applications/wyeb.desktop"
}
