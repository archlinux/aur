# Contributor: Ivy Foster <code@escondida.tk>

pkgname=rrootage
pkgver=0.23a
pkgrel=2
pkgdesc='Abstract shooter, created by Kenta Cho and ported to Linux by Evil Mr Henry.'
url='http://rrootage.sourceforge.net/'
license=('custom:rrootage')

arch=(x86_64 i686)
depends=(libbulletml sdl_mixer)
source=(
	"https://downloads.sourceforge.net/rrootage/rRootage-$pkgver.tar.gz"
	"http://http.debian.net/debian/pool/main/r/rrootage/rrootage_0.23a-12.debian.tar.xz"
)
sha256sums=(
	964edbe21802e3e40d6a8da19b61132decacd13bf9a71bac86abce012379ff07
	d0c35a0572ae1185b0f34c8df66d878481b7d83440ad9b9585610f4010437f88
)

prepare() {
	cd rRootage

	for patch in ../debian/patches/*.patch; do
		patch -Np1 <"$patch"
	done
}

build() {
	make -C rRootage/src -f makefile.lin
}

package() {
	cd debian
	install -D -m 644 rrootage.6 "$pkgdir/usr/share/man/man6/rrootage.6"
	install -D -m 644 rrootage.desktop \
		"$pkgdir/usr/share/applications/rrootage.desktop"
	install -D -m 644 rrootage.xpm "$pkgdir/usr/share/pixmaps/rrootage.xpm"

	cd "$srcdir/rRootage"
	install -d "$pkgdir/usr/share/games"
	cp -r rr_share "$pkgdir/usr/share/games/rrootage"
	install -D src/rrootage "$pkgdir/usr/bin/rrootage"

	install -D -m 644 readme.txt "$pkgdir/usr/share/licenses/rrootage/README.jp"
	install -m 644 readme_e.txt "$pkgdir/usr/share/licenses/rrootage/README.en"

	install -D -m 644 readme.txt "$pkgdir/usr/share/doc/rrootage/README.jp"
	install -m 644 readme_e.txt "$pkgdir/usr/share/doc/rrootage/README.en"
	install -m 644 readme_linux "$pkgdir/usr/share/doc/rrootage/README"
}
