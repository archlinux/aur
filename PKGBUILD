# Maintainer: Nikola Hadžić <nikola.hadzic.000@protonmail.com>
pkgname="tttt"
pkgver="1.0"
pkgrel=2
pkgdesc="Play tic-tac-toe in your terminal"
arch=("x86_64")
url="https://gitlab.com/NH000/tttt"
license=("GPL3")
depends=("libutf8proc" "gettext")
makedepends=("git" "coreutils")
source=("$pkgname::git+$url#tag=cf765e77253b1f170d92f980ba8df01638c8d7c8")
sha256sums=("SKIP")

build() {
	cd "$pkgname"
	make all OPTIMIZE=1
}

package() {
	cd "$pkgname"

    install -D -t "$pkgdir/usr/bin" "tttt"

    mkdir -p "$pkgdir/usr/share/locale/sr/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/sr/LC_MESSAGES/tttt.mo" "po/sr.po"
    mkdir -p "$pkgdir/usr/share/locale/sr_RS@latin/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/sr_RS@latin/LC_MESSAGES/tttt.mo" "po/sr_RS@latin.po"

    install -m 644 -D "man/man6/tttt.6.in" "$pkgdir/usr/share/man/man6/tttt.6"
    sed -i 's/\bTTTT_EXEC_NAME\b/tttt/' "$pkgdir/usr/share/man/man6/tttt.6"
    install -m 644 -D "man/sr/man6/tttt.6.in" "$pkgdir/usr/share/man/sr/man6/tttt.6"
    sed -i 's/\bTTTT_EXEC_NAME\b/tttt/' "$pkgdir/usr/share/man/sr/man6/tttt.6"
    install -m 644 -D "man/sr_RS@latin/man6/tttt.6.in" "$pkgdir/usr/share/man/sr_RS@latin/man6/tttt.6"
    sed -i 's/\bTTTT_EXEC_NAME\b/tttt/' "$pkgdir/usr/share/man/sr_RS@latin/man6/tttt.6"
}
