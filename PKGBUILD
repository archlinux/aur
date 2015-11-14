# Maintainer: Hexcles Ma <bob1211@gmail.com>
pkgname=rhythmbox-plugin-fileorganizer-git
pkgver=3.r16.ce123eb
pkgrel=1
pkgdesc="Music library organizer (move and rename files according to Rhythmbox database)"
arch=('any')
url="https://github.com/lachlan-00/rb-fileorganizer"
license=('CCPL')
groups=()
depends=('rhythmbox' 'python-gobject')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/lachlan-00/rb-fileorganizer.git')
noextract=()
sha256sums=('SKIP')

_gitroot='rb-fileorganizer'

pkgver() {
	cd "$srcdir/${_gitroot}"
# No tags available, but the author mentioned in README this was "version 3".
	printf "3.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd "$srcdir/${_gitroot}"
# make INSTALLPATH="$pkgdir/usr/lib/rhythmbox/plugins/fileorganizer/" install-req
	install -dm 755 "${pkgdir}"/usr/{lib,share}/rhythmbox/plugins/fileorganizer/
	install -m 644 *.py "${pkgdir}/usr/lib/rhythmbox/plugins/fileorganizer/"
	python -O -m compileall "${pkgdir}/usr/lib/rhythmbox/plugins/fileorganizer/"
	install -m 644 fileorganizer.plugin "${pkgdir}/usr/lib/rhythmbox/plugins/fileorganizer/"

	install -m 644 *.ui "${pkgdir}/usr/share/rhythmbox/plugins/fileorganizer/"
	cp -r template "${pkgdir}/usr/share/rhythmbox/plugins/fileorganizer/"

	install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -m 644 LICENSE AUTHORS "${pkgdir}/usr/share/licenses/${pkgname}/"
}
