# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=dooble
pkgver=2019.09.09
pkgrel=1
pkgdesc="Colorful Web browser"
arch=(x86_64)
url="https://textbrowser.github.io/dooble/"
license=('BSD')
depends=('qt5-webengine')
source=("$pkgname-$pkgver.tar.gz::https://github.com/textbrowser/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('8eae788757083d29846ad11a889c75c2f418309d1c248c09f45b2f10b64506c8')

prepare() {
	cd $pkgname-$pkgver/2.x
	sed -i '/QMAKE_LFLAGS_RELEASE += -Wl,-rpath/d' dooble.pro
	sed -i 's|Exec=.*|Exec=dooble|
                s|Icon=.*|Icon=dooble|' dooble.desktop
	sed -i 's|QString path(QDir::currentPath());|QString path("/usr/share/dooble");|' Source/dooble_settings.cc
}

build() {
	cd $pkgname-$pkgver/2.x
	qmake
	make
}

package() {
	cd $pkgname-$pkgver/2.x
	install -Dm755 Dooble "$pkgdir/usr/bin/dooble"
	install -Dm644 Icons/Logo/dooble.png "$pkgdir/usr/share/pixmaps/dooble.png"
	install -Dm644 dooble.desktop "$pkgdir/usr/share/applications/dooble.desktop"
	install -Dm644 -t "$pkgdir/usr/share/dooble/Translations" Translations/dooble_*.qm
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/dooble/LICENSE"
}
