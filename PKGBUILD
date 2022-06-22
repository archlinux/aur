# Maintainer: Nikola Hadžić <nikola.hadzic.000@protonmail.com>
pkgname="osa"
pkgver="1.0"
pkgrel=2
pkgdesc="Just another keylogger for Linux"
arch=("x86_64")
url="https://gitlab.com/NH000/osa"
license=("GPL3")
depends=("gettext")
makedepends=("git" "coreutils")
source=("$pkgname::git+$url#tag=2633c890e535c793460452279e48fc00365f68b7")
sha256sums=("SKIP")

build() {
	cd "$pkgname"
	make all OPTIMIZE=1
}

package() {
	cd "$pkgname"

    install -D -t "$pkgdir/usr/bin" "osa"

    mkdir -p "$pkgdir/usr/share/locale/sr/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/sr/LC_MESSAGES/osa.mo" "po/sr.po"
    mkdir -p "$pkgdir/usr/share/locale/sr_RS@latin/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/sr_RS@latin/LC_MESSAGES/osa.mo" "po/sr_RS@latin.po"

    install -m 644 -D "man/man1/osa.1.in" "$pkgdir/usr/share/man/man1/osa.1"
    sed -i 's/\bOSA_EXEC_NAME\b/osa/' "$pkgdir/usr/share/man/man1/osa.1"
    install -m 644 -D "man/sr/man1/osa.1.in" "$pkgdir/usr/share/man/sr/man1/osa.1"
    sed -i 's/\bOSA_EXEC_NAME\b/osa/' "$pkgdir/usr/share/man/sr/man1/osa.1"
    install -m 644 -D "man/sr_RS@latin/man1/osa.1.in" "$pkgdir/usr/share/man/sr_RS@latin/man1/osa.1"
    sed -i 's/\bOSA_EXEC_NAME\b/osa/' "$pkgdir/usr/share/man/sr_RS@latin/man1/osa.1"
}
