# Maintainer: Nikola Hadžić <nikola.hadzic.000@protonmail.com>
pkgname="wallo"
pkgver="1.0"
pkgrel=2
pkgdesc="Wallpaper Organizer"
arch=("any")
url="https://gitlab.com/NH000/wallo"
license=("GPL3")
depends=("bash" "coreutils" "gettext" "util-linux" "gawk" "xdg-utils" "imagemagick")
makedepends=("git")
source=("git+$url#tag=f53c2df9f7aba2169d2798c0ce3e74e96d578639")
sha256sums=("SKIP")

package() {
	cd "$srcdir/$pkgname"

    install -D "wallo.sh" "$pkgdir/usr/bin/wallo"
    sed -i '20s/$/"\/usr\/share\/locale"/' "$pkgdir/usr/bin/wallo"
    sed -i '21s/$/"wallo"/' "$pkgdir/usr/bin/wallo"

    install -m 644 -D "man/man1/wallo.1.in" "$pkgdir/usr/share/man/man1/wallo.1"
    sed -i 's/\bWALLO_EXEC_NAME\b/wallo/' "$pkgdir/usr/share/man/man1/wallo.1"
    install -m 644 -D "man/sr/man1/wallo.1.in" "$pkgdir/usr/share/man/sr/man1/wallo.1"
    sed -i 's/\bWALLO_EXEC_NAME\b/wallo/' "$pkgdir/usr/share/man/sr/man1/wallo.1"
    install -m 644 -D "man/sr_RS@latin/man1/wallo.1.in" "$pkgdir/usr/share/man/sr_RS@latin/man1/wallo.1"
    sed -i 's/\bWALLO_EXEC_NAME\b/wallo/' "$pkgdir/usr/share/man/sr_RS@latin/man1/wallo.1"

    mkdir -p "$pkgdir/usr/share/locale/sr/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/sr/LC_MESSAGES/wallo.mo" "po/sr.po"
    mkdir -p "$pkgdir/usr/share/locale/sr_RS@latin/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/sr_RS@latin/LC_MESSAGES/wallo.mo" "po/sr_RS@latin.po"
}
