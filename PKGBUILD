_pkgname=abstreet
pkgname=${_pkgname}-bin
pkgver=0.3.45
pkgrel=1
pkgdesc="A traffic simulation game exploring how small changes to roads affect everyone"
arch=('x86_64')
url="https://github.com/a-b-street/abstreet"
license=('Apache')
depends=()
conflicts=('abstreet-git')
source=("https://github.com/a-b-street/abstreet/releases/download/v${pkgver}/abstreet_linux_v${pkgver//./_}.zip"
	"$_pkgname.desktop")
sha256sums=('24caf220859592782e9d07bc062cbf9f560c35f79a0ea9eb5d857f5a2e50ed58'
            '8c20072d6d4270c380207c738d773682450b2b060fcfda0f994cab522087327f')


package() {
	cd "${srcdir}/${_pkgname}_linux_v${pkgver//./_}"

	mkdir -p "$pkgdir/opt/${_pkgname}"
        mkdir -p "$pkgdir/usr/bin"
        mkdir -p "$pkgdir/usr/share/applications"

	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "$srcdir/abstreet.desktop"
	install -D -m644 "data/system/assets/pregame/icon.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
	install -D -m644 "play_abstreet.sh" "${pkgdir}/usr/bin/abstreet"
	mv * "${pkgdir}/opt/${_pkgname}"
}

