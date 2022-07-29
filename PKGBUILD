# Maintainer: Aakash Sen Sharma <aakashsensharma@gmail.com>
pkgname=wayshot-bin
_pkgname=wayshot
pkgver=1.1.9
pkgrel=3
pkgdesc="A screenshot tool for wlroots compositors."
url="https://github.com/waycrate/wayshot"
license=('BSD')
arch=('x86_64')
optdepends=('slurp: for area selection')
makedepends=('scdoc' 'rust')
provides=('wayshot-bin')
conflicts=('wayshot-git' 'wayshot-musl-git')
source=("$_pkgname-bin::$url/releases/download/$pkgver/$_pkgname"
		"$_pkgname-src::git+https://git.sr.ht/~shinyzenith/$_pkgname"
		)
sha256sums=('SKIP'
			'SKIP'
			)

build() {
	cd $_pkgname-src
	rustc ./build.rs
	./build 1>/dev/null 2>/dev/null 3>/dev/null
}

package() {
	install -Dm 755 $_pkgname-bin "$pkgdir/usr/bin/$_pkgname"
	install -Dm 644 ./$_pkgname-src/docs/wayshot.1.gz "$pkgdir/usr/share/man/man1/wayshot.1.gz"
	install -Dm 644 ./$_pkgname-src/docs/wayshot.7.gz "$pkgdir/usr/share/man/man7/wayshot.7.gz"
}
