# Maintainer: DeedleFake <deedlefake at users dot noreply dot github dot com>
pkgname=coinomi-desktop
pkgver=latest
pkgrel=1
pkgdesc="Coinomi desktop wallet beta."
arch=(any)
url="https://coinomi.com"
license=('unknown')
depends=(java-environment)
source=("https://beta.coinomi.com/desktopinstallers/Coinomi.deb"
				"coinomi.png")
md5sums=('45aa4155b562df136255a774adc84230'
         '32768fd536544331a3df7e7c453c3e9a')
sha512sums=('320c2a5fad48409419c5584efedee5ba74f15fb2292615c572321ea9d67a4195f7b951a7cce132a636a78fd34ab010cabb968e6cede5e54e2b8c4c15172b0ac7'
            '0b39aee225dbb9fb31348695f58f4f9d7f5c754b4e616443f40f4fb8565f8759cad3054de87ea2954d4fa4e6b2b98a8059f3ad265cddd0a856f95818eaebfffc')

prepare() {
	bsdtar -xvf "data.tar.gz"
}

build() {
	rm "usr/bin/coinomi"
	mv "usr/bin/coinomi.sh" "usr/bin/coinomi"
	chmod a+x "usr/bin/coinomi"

	sed -i 's/^Icon=.*$/Icon=coinomi/g' "usr/share/applications/coinomi.desktop"
}

package() {
	cp -a "usr" "$pkgdir/usr"

	install -Dm644 "coinomi.png" "$pkgdir/usr/share/pixmaps/coinomi.png"
}
