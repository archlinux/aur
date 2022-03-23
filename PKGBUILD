# Maintainer: Yurii <yu hrysh at posteo dot net>

_pkgname=readability-cli
pkgname="deno-$_pkgname"
_author=gardenappl
pkgver=2.4.0
pkgrel=1
pkgdesc="Firefox Reader Mode in your terminal! - CLI tool for Mozilla's Readability library"
arch=('any')
url='https://gitlab.com/gardenappl/readability-cli'
license=('GPL3')
provides=('readability-cli' 'readable')
conflicts=('readability-cli')
depends=('deno')
makedepends=('deno')
source=(
	"https://gitlab.com/$_author/$_pkgname/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.bz2"
	readable
	readable-sandbox
)

package() {
	cd "$srcdir/$_pkgname-v$pkgver"

	install -Dm644 *.mjs -t "$pkgdir/usr/lib/$_pkgname/"
	install -Dm755 readable.ts -t "$pkgdir/usr/lib/$_pkgname/"
	install -Dm644 locales/*.json -t "$pkgdir/usr/lib/$_pkgname/locales"

	install -Dm644 readability-cli.1 -t "$pkgdir/usr/share/man/man1"
	ln -s ./readability-cli.1 "$pkgdir/usr/share/man/man1/readable.1"

	# Symlinks
	cd "$srcdir"

	install -Dm755 readable -t "$pkgdir/usr/bin"
	install -Dm755 readable-sandbox -t "$pkgdir/usr/bin"

	# Shell completions (buggy in Deno atm)
	#cd "$pkgdir/usr/bin"
	#SHELL=/bin/zsh ./readable --completion \
	#	| install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_readable"
	#SHELL=/bin/bash ./readable --completion \
	#	| install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/readable"
}
b2sums=('60c6f69329696836a9faf77c6b56ce650f17dedde35ec081e13558f1b7577f87cc9c56865caffbd86b8b3f15c389f5f5474581a7a4965757fe3564916e28d936'
        '792be8184fbdf51fc8a4aa90b9c55de9814700bb1396ac24dd7a1759413144ddabd64ff7391f55b9ae602a0415b86a7a51fbfda0e1856cd1a476f232fea4939c'
        '43611897b8da061ef7bea6513d05c42ea73c17a35020b86f68a62e61a26b0d6cd61d0440cfb6625d30eac9393d8f8d7ce94d40f1c6797f9cf85e45d73f983c86')
