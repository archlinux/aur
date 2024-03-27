# Maintainer: tippfehlr <tippfehlr at tippfehlr dot eu>

_pkgname=wrestic
pkgname=wrestic-bin
pkgver=1.6.1
pkgrel=1
pkgdesc='A wrapper around restic built in rust'
arch=('x86_64')
url="https://github.com/alvaro17f/$_pkgname"
license=('LGPL-3.0-only')
provides=('wrestic')
conflicts=('wrestic')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname.tar.gz")
sha256sums=('903c7cb7d4ccc628c36d88d2c79d876fedaeb3eca5ecf8a445f7c989d85f9805')

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
