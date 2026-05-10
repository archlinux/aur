# Maintainer: Aethar <elliott.ashby88@gmail.com>

pkgname=gopdf-git
pkgver=0.1.0.r0.3bf54a5
pkgrel=1
pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --long 2>/dev/null | sed 's/\([^-]*-\)g/r/; s/-/_/g'
}
pkgdesc="MuPDF-backend PDF viewer written in Go with Lua configuration"
arch=('x86_64')
url="https://github.com/Aethar01/gopdf.git"
license=('AGPL')
depends=('sdl2-compat' 'libmupdf')
makedepends=('go' 'git')
provides=('gopdf')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --long 2>/dev/null | sed 's/\([^-]*-\)g/r/; s/-/_/g'
}

build() {
    cd "$srcdir/$pkgname"
    go build -o gopdf .
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 gopdf "$pkgdir/usr/bin/gopdf"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 gopdf.desktop "$pkgdir/usr/share/applications/"
}
