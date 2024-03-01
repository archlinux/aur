# Maintainer: tippfehlr <tippfehlr at tippfehlr dot eu>

_pkgname=wrestic
pkgname=wrestic-bin
pkgver=1.6.0
pkgrel=1
pkgdesc='A wrapper around restic built in rust'
arch=('x86_64')
url="https://github.com/alvaro17f/$_pkgname"
license=('LGPL-3.0-only')
provides=('wrestic')
conflicts=('wrestic')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname.tar.gz")
sha256sums=('cfd91e2060c15ef5c66dacb6bb0f370017074e0822ee8ba763867af14cef2463')

build() {
	cd $srcdir
	# completions
	for shell in bash zsh fish; do
		./$_pkgname completions $shell >$shell-completion
	done
}

package() {
	install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 "$srcdir/bash-completion" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dm644 "$srcdir/zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
	install -Dm644 "$srcdir/fish-completion" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
}
