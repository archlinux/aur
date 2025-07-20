# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
pkgname="scrapscript-git"
pkgver=r428.467a577
pkgrel=3
pkgdesc="A functional, content-addressable programming language"
arch=('any')
url="https://github.com/tekknolagi/scrapscript"
license=('MIT')
depends=('python' 'bash' 'ape-loader-bin')
makedepends=('cosmocc-bin')
source=("git+$url.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/scrapscript"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/scrapscript"
    ./util/build-com
    printf "%b" "\n\n------------------\nInstalled as \e[1;34mscrap\e[0m\n------------------\n\n"
}

package() {
	install -Dm755 "$srcdir"/scrapscript/scrapscript.com "$pkgdir/usr/bin/scrap"
    install -Dm755 "$srcdir"/scrapscript/scrapscript.com "$pkgdir/usr/lib/scrapscript/scrapscript.com"
    install -Dm755 "$srcdir"/scrapscript/scrapscript.py "$pkgdir/usr/lib/scrapscript/scrapscript.py"
    install -Dm644 "$srcdir"/scrapscript/README.md "$pkgdir/usr/share/doc/scrapscript"
}

