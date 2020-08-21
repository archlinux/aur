# Maintainer: relrel <relrelbachar@gmail.com>

pkgname=vim-mojom
pkgver=20200821.7ab28be723
pkgrel=1
pkgdesc="Syntax highlighting support for Mojom IDL"
arch=('any')
url="https://chromium.googlesource.com/chromium/src.git/+/HEAD/tools/vim/mojom/"
license=('BSD')
groups=(vim-plugins)
depends=(vim)
makedepends=(git)

pkgver() {
	cd "$srcdir/src/"
	printf "%s.%s" $(date +%Y%m%d -d @$(git show -s --format=%ct HEAD)) $(git rev-parse --short HEAD)
}

prepare() {
	git clone --depth=1 --no-checkout https://chromium.googlesource.com/chromium/src "$srcdir/src/"
	cd "$srcdir/src/"
	git checkout HEAD -- LICENSE tools/vim/mojom/
}

package() {
	cd "$srcdir/src/tools/vim/mojom/"
	install -d "$pkgdir/usr/share/vim/vimfiles/"
	cp -r -t "$pkgdir/usr/share/vim/vimfiles/" ftdetect/ syntax/
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/src/LICENSE"
}
