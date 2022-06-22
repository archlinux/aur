# Maintainer: Nikola Hadžić <nikola.hadzic.000@protonmail.com>
pkgname="airpad"
pkgver="1.0"
pkgrel=2
pkgdesc="Basic GUI text editor"
arch=("x86_64")
url="https://gitlab.com/NH000/airpad"
license=("GPL3")
depends=("gtk3" "gettext")
makedepends=("git" "coreutils")
source=("git+$url#tag=7602564b3f944fc331e4785c4fb45ca21a90c3f0")
sha256sums=("SKIP")

build() {
	cd "$srcdir/$pkgname"
	make all OPTIMIZE=1
}

package() {
	cd "$srcdir/$pkgname"

    install -D -t "$pkgdir/usr/bin" "airpad"

    mkdir -p "$pkgdir/usr/share/locale/sr/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/sr/LC_MESSAGES/airpad.mo" "po/sr.po"
    mkdir -p "$pkgdir/usr/share/locale/sr_RS@latin/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/sr_RS@latin/LC_MESSAGES/airpad.mo" "po/sr_RS@latin.po"

    install -m 644 -D "icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/airpad.svg"

    mkdir -p "$pkgdir/usr/share/applications"
    echo -e '[Desktop Entry]\nType=Application\nVersion=1.5\nName=Airpad\nGenericName=Text editor\nGenericName[sr]=Уређивач текста\nGenericName[sr_RS@latin]=Uređivač teksta\nComment=Edit text\nComment[sr]=Уредите текст\nComment[sr_RS@latin]=Uredite tekst\nIcon=airpad\nDBusActivatable=true\nTryExec=/usr/bin/airpad\nExec=/usr/bin/airpad %F\nTerminal=false\nMimeType=text/english;text/plain;text/x-makefile;text/x-c++hdr;text/x-c++src;text/x-chdr;text/x-csrc;text/x-java;text/x-moc;text/x-pascal;text/x-tcl;text/x-tex;application/x-shellscript;text/x-c;text/x-c++;\nCategories=Utility;TextEditor;\nStartupNotify=true' > "$pkgdir/usr/share/applications/com.gitlab.NH000.Airpad.desktop"
}
