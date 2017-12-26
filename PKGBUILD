# Maintainer: Dan Printzell <arch@vild.io>
# Contributor: Marius O<marius@habarnam.ro>

pkgname=('coedit-bin')
pkgver=3.5.2
pkgrel=1
pkgdesc="Coedit is an IDE for the DMD D2 compiler."
url="https://github.com/BBasile/Coedit"
license=('MIT')
makedepends=('unzip')
depends=(
	'dmd'
	'dcd'
	'gtk2'
)
optdepends=(
	'gdb: optional, the GNU debugger'
	'dtools: optional, allows to demangle the symbols in the message widget'
	'dub: optional, the D package manager, mandatory to compile project in DUB format'
	'dfmt: optional, the D source code formater, needed by the Dfmt commander widget'
	'dscanner: optional, the D source code analyzer'
	'ldc: optional, the LDC D compiler'
	'gdc: optional, the GDC D compiler'
)
provides=("coedit")
conflicts=("coedit")
arch=("x86_64")

source=(
	"https://github.com/BBasile/Coedit/releases/download/v$pkgver/${pkgname%-bin}.${pkgver//_}.linux64.zip"
	"coedit.desktop"
)

sha256sums=('c5c898679390d5e6ff43e5515c5ff53325b936ef6745a127ec0589404fb1bd18'
            '9bcecc4297d96667bafe7a3d30b6e36095c1e91d7fa687afc6fc8fda5f1842ab')


package() {
	# binaries
	install -Dm755 "$srcdir/coedit-$CARCH/coedit" "$pkgdir/usr/bin/coedit"
	install -Dm755 "$srcdir/coedit-$CARCH/dastworx" "$pkgdir/usr/bin/dastworx"

	# license
	install -Dm644 "$srcdir/coedit-$CARCH/coedit.license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# .desktop
	install -Dm644 "$srcdir/coedit-$CARCH/coedit.png" "$pkgdir/usr/share/icons/coedit.png"
	install -Dm644 coedit.desktop "$pkgdir/usr/share/applications/coedit.desktop"
}
