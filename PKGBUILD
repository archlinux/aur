# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

_pkgname=wrestic
pkgname=wrestic-bin
pkgver=1.7.2
pkgrel=1
pkgdesc='A wrapper around restic built in rust'
arch=('x86_64')
url="https://github.com/alvaro17f/$_pkgname"
license=('LGPL-3.0-only')
provides=('wrestic')
conflicts=('wrestic')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname.tar.gz")
sha256sums=('fbc6602bd73a754805383071d413e04107260f41007e6c87bb89890b4ca7d026')

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
