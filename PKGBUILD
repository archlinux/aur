# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
pkgname="scrapscript-git"
pkgver=r377.03e0ac2
pkgrel=1
pkgdesc="A functional, content-addressable programming language"
arch=('any')
url="https://github.com/tekknolagi/scrapscript"
license=('MIT')
depends=('python' 'bash')
optdepends=('cosmocc: compiling scrap elf binaries')
source=("git+$url.git" "scrap")
noextract=()
sha256sums=('SKIP' '31d8d14556c3af454bb5032585bb57bf2ac1cd18d86536abd7a4ded68e6f0094')

pkgver() {
    cd "$srcdir/scrapscript"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/scrapscript"
    ./build-com
    printf "%b" "\n\n------------------\nInstalled as \e[1;34mscrap\e[0m\n------------------\n\n"
}

package() {
	install -Dm755 "$srcdir"/scrap "$pkgdir/usr/bin/scrap"
    install -Dm755 "$srcdir"/scrapscript/scrapscript.com "$pkgdir/usr/lib/scrapscript/scrapscript.com"
    install -Dm755 "$srcdir"/scrapscript/scrapscript.py "$pkgdir/usr/lib/scrapscript/scrapscript.py"
    install -Dm644 "$srcdir"/scrapscript/README.md "$pkgdir/usr/share/doc/scrapscript"
}
