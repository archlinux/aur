# Maintainer: Aethar <elliott.ashby88@gmail.com>

pkgname=gopdf-git
pkgver=0.1.20.r1.g1a4574b
pkgrel=2
pkgdesc="MuPDF-backend PDF viewer written in Go with Lua configuration"
arch=('x86_64')
url="https://github.com/Aethar01/gopdf.git"
license=('AGPL')
depends=('sdl3' 'libmupdf' 'gtk3')
makedepends=('go' 'git')
provides=('gopdf')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	go build -o gopdf .
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 gopdf "$pkgdir/usr/bin/gopdf"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 gopdf.desktop "$pkgdir/usr/share/applications/gopdf.desktop"
	install -Dm644 assets/gopdf.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/gopdf.svg"
}
