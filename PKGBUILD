# Maintainer: relrel <relrelbachar@gmail.com>

pkgname=vim-torque
pkgver=20200821.e0973e6
pkgrel=1
pkgdesc="Syntax highlighting support for the V8 Torque domain-specific language"
arch=('any')
url="https://chromium.googlesource.com/v8/v8/+/HEAD/tools/torque/vim-torque/"
license=('BSD')
groups=(vim-plugins)
depends=(vim)
makedepends=(git)

pkgver() {
	cd "$srcdir/v8/"
	printf "%s.%s" $(date +%Y%m%d -d @$(git show -s --format=%ct HEAD)) $(git rev-parse --short HEAD)
}

prepare() {
	git clone --depth=1 --no-checkout https://chromium.googlesource.com/v8/v8 "$srcdir/v8/"
	cd "$srcdir/v8/"
	git checkout HEAD -- LICENSE tools/torque/vim-torque/
}

package() {
	cd "$srcdir/v8/tools/torque/vim-torque/"
	install -d "$pkgdir/usr/share/vim/vimfiles/"
	cp -r -t "$pkgdir/usr/share/vim/vimfiles/" ftdetect/ syntax/
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/v8/LICENSE"
}
