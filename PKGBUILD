# Maintainer: Castor <whoisyoges at castorisdead dot xyz>

pkgname=ewm
pkgver=1.1
pkgrel=0
pkgdesc="An elegant window manager, that just floats perfectly."
url="https://github.com/pwnwriter/ewm"
arch=('any')
license=('MIT')
depends=('libx11' 'libxinerama' 'libxft' 'freetype2')
optdepends=('doas: powermenu shut-dowm, reboot and sleep'
            'imagemagick: screenshots')
makedepends=('git')
conflicts=('ewm' 'ewm-bin')
provides=("${pkgname}")
options=(!strip !emptydirs)
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname/"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
	cd "$srcdir/$pkgname/src"
	install -Dm755 ./ewm "${pkgdir}/usr/bin/ewm"
	install -Dm755 ./swpb "${pkgdir}/usr/bin/swpb"
	install -Dm644 ./ewm.1 "${pkgdir}/usr/share/man/man1/ewm.1"
}
