# Maintainer: Jan Martin Reckel <jm.reckel@t-online.de>
pkgname=cantara
pkgver=2.7.0
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
md5sums=('741bd861986bc540a1acc2a69abcc5e7')

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	mkdir -p $pkgdir/usr/bin/
	cd "$pkgname-$pkgver"
	install cantara $pkgdir/usr/bin/cantara
	# Generic installation for all .mo files
	# This looks into src/languages/[lang]/cantara.mo and moves it to the correct system path
		for _mo in src/languages/*/cantara.mo; do
		_lang=$(basename "$(dirname "$_mo")")
		install -Dm644 "$_mo" "$pkgdir/usr/share/locale/$_lang/LC_MESSAGES/cantara.mo"
	done
	install -D app.cantara.Cantara.desktop $pkgdir/usr/share/applications/cantara.desktop
        install -D app.cantara.Cantara.png $pkgdir/usr/share/icons/app.cantara.Cantara.png
        mkdir -p $pkgdir/usr/share/cantara/
	cp -r src/backgrounds $pkgdir/usr/share/cantara/
}
