# Maintainer: gardenapple <mailbox@appl.garden>

_pkgname=readability-cli
pkgname="deno-$_pkgname"
_author=gardenappl
pkgver=2.4.4
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
b2sums=('9fa3e23348b5ea8ba9c2c28b8008654ca34122a54d0fee7a6e78f06dea8a99dd8e2a16e9a750b56378528b6e87928bc6575a7e6de12da588f064a32ae5287370'
        '792be8184fbdf51fc8a4aa90b9c55de9814700bb1396ac24dd7a1759413144ddabd64ff7391f55b9ae602a0415b86a7a51fbfda0e1856cd1a476f232fea4939c'
        '55fad2e72126bc7b3253ee6598e3e3c83d63a3d4da03402a828ac8f1a5d321e98f25484e74d4654082f7a41dd1d45465878ac41d91b48391adce15f3921ee0ca')
