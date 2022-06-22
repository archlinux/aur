# Maintainer: Nikola Hadžić <nikola.hadzic.000@protonmail.com>
pkgname="image2ascii"
pkgver="1.0"
pkgrel=3
pkgdesc="Simple image–to–ASCII art conversion tool"
arch=("any")
url="https://gitlab.com/NH000/image2ascii"
license=("MIT")
depends=("python3" "python-pillow")
makedepends=("git" "coreutils")
source=("git+$url#tag=d7dffe0065a949a40acc652e8695c439bfb66605")
sha256sums=("SKIP")

package() {
	cd "$srcdir/$pkgname"

    install -D "image2ascii.py" "$pkgdir/usr/bin/image2ascii"
    sed -i '33s/\bNone\b/"image2ascii"/' "$pkgdir/usr/bin/image2ascii"
    sed -i '34s/\bNone\b/"\/usr\/share\/locale"/' "$pkgdir/usr/bin/image2ascii"

    mkdir -p "$pkgdir/usr/share/locale/sr/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/sr/LC_MESSAGES/image2ascii.mo" "po/sr.po"
    mkdir -p "$pkgdir/usr/share/locale/sr_RS@latin/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/sr_RS@latin/LC_MESSAGES/image2ascii.mo" "po/sr_RS@latin.po"

    install -m 644 -D -t "$pkgdir/usr/share/licenses/image2ascii" "LICENSE"
}
