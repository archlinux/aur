# Maintainer:
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: Konstantin Mochalov <incredible dot angst at gmail dot com>
# Contributor: FredBezies <fredbezies at gmail dot com>
# Contributor: Sean Bartell <archlinux at yotann dot org>

pkgname=ncsa-mosaic-git
epoch=1
pkgver=2.7b6.r25.af942b9
_pkgver=2.7b6
pkgrel=2
pkgdesc="One of the first graphical web browsers"
url="https://github.com/yotann/ncsa-mosaic"
license=('custom')
arch=('i686' 'x86_64')
depends=('openmotif' 'libjpeg' 'libpng' 'libxmu' 'libxpm' 'xorg-fonts-misc' 'xorg-fonts-100dpi'
         'xorg-fonts-75dpi')
makedepends=('git')
provides=("${pkgname%-git}" 'mosaic')
conflicts=("${pkgname%-git}" 'mosaic')
options=(!makeflags)
source=('git+https://github.com/yotann/ncsa-mosaic.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make linux
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 src/Mosaic -t "$pkgdir/usr/bin"
	install -Dm644 COPYRIGHT -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
	install -Dm644 desktop/Mosaic.png -t "$pkgdir/usr/share/icons"
	install -Dm644 desktop/Mosaic.desktop -t "$pkgdir/usr/share/applications"
	install -Dm644 docs/resources.html -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
