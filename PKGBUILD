# Maintainer: Aleksandr <contact at via dot aur>

pkgname=ponomar-git
pkgver=r918.59c46fd3c
pkgrel=2
pkgdesc="Ponomar is a fully-functional program suite for the Orthodox Church"
arch=('any')
url="https://github.com/typiconman/ponomar.git"
license=('GPL-3.0')
depends=('java-runtime' 'texinfo')
optdepends=('otf-churchslavonic')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=("ponomar::git+$url"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh"
        "${pkgname%-git}.png")
md5sums=('SKIP'
         'e45995e6c6cb6122bb36ca9cf53c6641'
         '47b1fb0d4be2af9f867a52747bb7b703'
         'd8b4f7dd400cd7240ec63c8bcaddaec6')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}
package() {
	cd "$srcdir/${pkgname%-git}"
	
	install -dm0755 "$pkgdir/opt/${pkgname%-git}"
	cp -r Ponomar "$pkgdir/opt/${pkgname%-git}/"
	install -dm0755 "$pkgdir/usr/bin"

	install -D -m644 ../${pkgname%-git}.desktop "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
	install -D -m644 ../${pkgname%-git}.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
	install -D -m755 ../${pkgname%-git}.sh "$pkgdir/opt/${pkgname%-git}/ponomar.sh"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -D -m644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"

	ln -s /opt/ponomar/ponomar.sh "$pkgdir/usr/bin/ponomar"

	# Fix permissions
  chmod 666 "$pkgdir/opt/${pkgname%-git}/Ponomar/languages/xml/${pkgname%-git}.config"
}

# vim: set ts=2 sw=2 ft=sh noet:
