# Maintainer: PersianGolf <Freefighter81@protonmail.com>
pkgname=voicegen
pkgver=1.6.3
pkgrel=1
pkgdesc="Convert text to speech using multiple engines"
arch=(x86_64)
url="https://gitlab.com/PersianGolf/voicegen/"
license=('GPL')
depends=('qt5-multimedia' 'qt5-base')
optdepends=('svox-pico-bin' 'ffmpeg')
makedepends=('qt5-multimedia')
provides=(voicegen)
conflicts=(voicegen)
install=
source=("https://gitlab.com/PersianGolf/voicegen/-/archive/${pkgver}/voicegen-${pkgver}.tar.gz")
md5sums=('SKIP')


build() {
	cd $pkgname-$pkgver
	cmake CMakeLists.txt
	make
}


package() {
	cd $pkgname-$pkgver
	install -Dm777 voicegen ${pkgdir}/usr/bin/voicegen
	sed -i '11s/.*/Icon=voicegen/' Integration-Stuff/desktop/voicegen.desktop
	install -Dm644 Integration-Stuff/desktop/voicegen.desktop $pkgdir/usr/share/applications/voicegen.desktop
    for res in 32 48 64 128 256 512; do
	 install -Dm644 Integration-Stuff/icons/${res}x${res}/voicegen.png $pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/voicegen.png
    done
    install -Dm644 Integration-Stuff/icons/scalable/voicegen.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/voicegen.svg
}
