# Maintainer: Jan Martin Reckel <jm.reckel@t-online.de>
pkgname=cantara
pkgver=2.4.1
pkgrel=1
epoch=
pkgdesc="Song Presentation Software"
arch=('x86_64')
url="https://github.com/reckel-jm/cantara"
license=('GPL3')
groups=()
depends=('qt5pas')
conflicts=('cantara-bin')
makedepends=('lazarus-qt5' 'qt5pas')
provides=("cantara")
source=("https://github.com/reckel-jm/cantara/archive/refs/tags/v$pkgver.zip")
md5sums=('19e683b7c26e3c815dd128e3380cabf9')

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"/src/
	#make
	lazbuild -B --bm="Release" Cantara.lpi --ws=qt5
}

package() {
	mkdir -p $pkgdir/usr/bin/
	cd "$pkgname-$pkgver"
	install src/cantara $pkgdir/usr/bin/cantara
	mkdir -p $pkgdir/usr/share/locale/de/LC_MESSAGES
	install -D src/languages/de/cantara.mo $pkgdir/usr/share/locale/de/LC_MESSAGES/cantara.mo
	install -D src/languages/zh/cantara.mo $pkgdir/usr/share/locale/zh/LC_MESSAGES/cantara.mo
	install -D src/languages/it/cantara.mo $pkgdir/usr/share/locale/it/LC_MESSAGES/cantara.mo
	install -D src/languages/es/cantara.mo $pkgdir/usr/share/locale/es/LC_MESSAGES/cantara.mo
	install -D app.cantara.Cantara.desktop $pkgdir/usr/share/applications/cantara.desktop
    install -D app.cantara.Cantara.png $pkgdir/usr/share/icons/app.cantara.Cantara.png
}
