# Maintainer: Jan Martin Reckel <jm.reckel@t-online.de>
pkgname=cantara
pkgver=2.6.0
pkgrel=1
epoch=
pkgdesc="Song Presentation Software"
arch=('x86_64')
url="https://github.com/reckel-jm/cantara"
license=('GPL3')
groups=()
depends=('qt6pas')
conflicts=('cantara-bin')
makedepends=('lazarus' 'qt6pas')
provides=("cantara")
source=("https://github.com/reckel-jm/cantara/archive/refs/tags/v$pkgver.zip")
md5sums=('413bf8eda77545602f3f24272131fc92')

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"/src/
	#make
	lazbuild -B --bm="Release" Cantara.lpi --ws=qt6
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
	install -D src/languages/nl/cantara.mo $pkgdir/usr/share/locale/nl/LC_MESSAGES/cantara.mo
	install -D app.cantara.Cantara.desktop $pkgdir/usr/share/applications/cantara.desktop
    install -D app.cantara.Cantara.png $pkgdir/usr/share/icons/app.cantara.Cantara.png
    mkdir -p $pkgdir/usr/share/cantara/
	cp -r src/backgrounds $pkgdir/usr/share/cantara/
}
