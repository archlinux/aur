# Maintainer: Julien Savard <juju@juju2143.ca>
pkgname=x16-docs-git
pkgver=r33.6fee76f
pkgrel=1
pkgdesc="Documentation not found in other packages for The 8-Bit Guy's Commander X16"
arch=('any')
url="http://commanderx16.com/"
license=('unknown')
groups=('commander-x16')
depends=()
makedepends=('git' 'pandoc')
optdepends=('x16-emulator: X16 emulator'
            'x16-rom: X16 ROMs')
provides=('x16-docs')
conflicts=('x16-docs')
replaces=()
options=()
install=
changelog=
source=("git+https://github.com/commanderx16/x16-docs.git"
	"https://raw.githubusercontent.com/commanderx16/x16-emulator/master/github-pandoc.css"
	"https://raw.githubusercontent.com/commanderx16/x16-emulator/master/mdtohtml.lua")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

pkgver() {
        cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
	pandoc --from gfm --to html -c github-pandoc.css --standalone --metadata pagetitle="Commander X16 Programmer's Reference Guide" Commander\ X16\ Programmer\'s\ Reference\ Guide.md --output Programmer\'s\ Reference\ Guide.html --lua-filter=../mdtohtml.lua
	pandoc --from gfm --to html -c github-pandoc.css --standalone --metadata pagetitle="VERA Programmer's Reference.md" VERA\ Programmer\'s\ Reference.md --output VERA\ Programmer\'s\ Reference.html
}

package() {
	cd "${pkgname%-git}"
	install -Dm644 ../github-pandoc.css "$pkgdir/usr/share/doc/${pkgname%-git}/github-pandoc.css"
	install -Dm644 Programmer\'s\ Reference\ Guide.html "$pkgdir/usr/share/doc/${pkgname%-git}/Programmer's Reference Guide.html"
	install -Dm644 VERA\ Programmer\'s\ Reference.html "$pkgdir/usr/share/doc/${pkgname%-git}/VERA Programmer's Reference.html"
}
