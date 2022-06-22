# Maintainer: Nikola Hadžić <nikola.hadzic.000@protonmail.com>
pkgname="pbk"
pkgver="1.0"
pkgrel=2
pkgdesc="A tool for backing up and retrieving files locally"
arch=("any")
url="https://gitlab.com/NH000/pbk"
license=("MIT")
depends=("python3")
makedepends=("git" "coreutils")
source=("git+$url#tag=e74e1691b72557f4e7fbb981ae979a2b7ae3c148")
sha256sums=("SKIP")

package() {
	cd "$srcdir/$pkgname"

    install -D "pbk.py" "$pkgdir/usr/bin/pbk"
    sed -i '34s/\bNone\b/"\/usr\/share\/locale"/' "$pkgdir/usr/bin/pbk"
    sed -i '35s/\bNone\b/"pbk"/' "$pkgdir/usr/bin/pbk"

    install -m 644 -D "man/man1/pbk.1.in" "$pkgdir/usr/share/man/man1/pbk.1"
    sed -i 's/\bPBK_EXEC_NAME\b/pbk/' "$pkgdir/usr/share/man/man1/pbk.1"
    install -m 644 -D "man/sr/man1/pbk.1.in" "$pkgdir/usr/share/man/sr/man1/pbk.1"
    sed -i 's/\bPBK_EXEC_NAME\b/pbk/' "$pkgdir/usr/share/man/sr/man1/pbk.1"
    install -m 644 -D "man/sr_RS@latin/man1/pbk.1.in" "$pkgdir/usr/share/man/sr_RS@latin/man1/pbk.1"
    sed -i 's/\bPBK_EXEC_NAME\b/pbk/' "$pkgdir/usr/share/man/sr_RS@latin/man1/pbk.1"

    mkdir -p "$pkgdir/usr/share/locale/sr/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/sr/LC_MESSAGES/pbk.mo" "po/sr.po"
    mkdir -p "$pkgdir/usr/share/locale/sr_RS@latin/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/sr_RS@latin/LC_MESSAGES/pbk.mo" "po/sr_RS@latin.po"

    install -m 644 -D -t "$pkgdir/usr/share/licenses/pbk" "LICENSE"
}
