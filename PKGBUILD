# Maintainer: Dan Printzell <arch@vild.io>
# Contributor: Marius O<marius@habarnam.ro>

pkgname=('coedit-bin')
pkgver=3_update_3
pkgrel=2
pkgdesc="Coedit is an IDE for the DMD D2 compiler."
url="https://github.com/BBasile/Coedit"
license=('MIT')
makedepends=('unzip')
depends=(
	'dmd'
	'dcd'
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
arch=("x86" "x86_64")

source_i686=(
	"https://github.com/BBasile/Coedit/releases/download/${pkgver}/${pkgname%-bin}.${pkgver//_}.linux32.zip"
	"coedit.desktop"
)

source_x86_64=(
	"https://github.com/BBasile/Coedit/releases/download/${pkgver}/${pkgname%-bin}.${pkgver//_}.linux64.zip"
	"coedit.desktop"
)

sha256sums_i686=('c07f76872be6de4c5dba63cb4430f8204c44bf2fb89f03054fb3a0547be0f83f'
                 '9bcecc4297d96667bafe7a3d30b6e36095c1e91d7fa687afc6fc8fda5f1842ab')

sha256sums_x86_64=('b7a2001c90537d9c29885d17c6cfd1be0d10c6efd9a857f3846f0bcdb4a5f4e7'
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
