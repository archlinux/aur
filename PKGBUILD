# Maintainer: Michael O'Leary <michael.oleary.math@gmail.com>

pkgname=typesettersdesk-git
_pkgname=typesettersdesk
pkgver=0.5.6
pkgrel=1
pkgdesc="Manage your typesetting projects"
arch=('x86_64')
url="https://www.typesettersdesk.org"
license=('GPL2')
depends=(qt5-base
		 qt5-multimedia
		 qt5-tools
		 qt5-webengine
		 poppler-qt5
		 ktexteditor
		 breeze-icons
		 hunspell
		 mythes
		 texlive-core
		 hunspell-en_us)
makedepends=(git cmake)
provides=($_pkgname)
source=("git+https://gitlab.com/michael.oleary.math/typesettersdesk.git")
md5sums=('SKIP')

build() {
	cd $_pkgname
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd $_pkgname
	install -Dm644 typesettersdesk.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 help/typesettersdesk.qch "$pkgdir/usr/share/doc/$_pkgname/$_pkgname.qch"
	install -Dm644 help/typesettersdesk.qhc "$pkgdir/usr/share/doc/$_pkgname/$_pkgname.qhc"
	install -Dm644 help/html/main.css "$pkgdir/usr/share/$_pkgname/main.css"
	install -Dm644 xml/LaTeX.xml "$pkgdir/usr/share/$_pkgname/LaTeX.xml"
	install -Dm644 resources/logo.png "$pkgdir/usr/share/$_pkgname/logo.png"
	install -Dm644 spelling/th_en_US_v2.dat "$pkgdir/usr/share/$_pkgname/th_en_US_v2.dat"
	install -Dm644 spelling/th_en_US_v2.idx "$pkgdir/usr/share/$_pkgname/th_en_US_v2.idx"
	install -Dm755 build/typesettersdesk "$pkgdir/usr/bin/$_pkgname"
}

