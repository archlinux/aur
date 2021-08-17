# Maintainer: zenekron <zenekron@gmail.com>
pkgname=konsole-dracula-git
pkgver=r16.fa85573
pkgrel=1
pkgdesc="Dracula theme for konsole"
arch=("any")
url="https://draculatheme.com/konsole/"
license=("MIT")
makedepends=("git")
optdepends=("konsole")
provides=("konsole-dracula")
conflicts=("konsole-dracula")
source=("$pkgname::git+https://github.com/dracula/konsole")
md5sums=("SKIP")

pkgver() {
	cd "$pkgname"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm 644 "Dracula.colorscheme" "$pkgdir/usr/share/konsole/Dracula.colorscheme"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

