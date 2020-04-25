# Maintainer: CoiledSpring
# Contributor: Eric Griffis <dedbox at gmail dot com>

pkgname=twinejs-standalone
pkgver=2.3.7
pkgrel=1
pkgdesc="an open-source tool for telling interactive, nonlinear stories"
arch=('x86_64')
url="http://twinery.org/"
license=('GPL3')

depends=('libxss'
	 'gconf'
	 'nss'
	 'gtk3')

source=("https://github.com/klembot/twinejs/releases/download/${pkgver}/twine_${pkgver}_linux64.zip"
        "http://twinery.org/homepage/img/logo.svg"
        "twinejs.desktop")

md5sums=('26d6636c7831d2cdaca1ac4087694f3c'
         'c7119a1fb9d65014691b77778e5e5ec7'
         '71705539c71923a8464240a8cb3e567f')

options=(!strip)
noextract=(twine_${pkgver}_linux64.zip)

prepare() {
	mkdir -p ${pkgname}_${pkgver}_linux64
	bsdtar -xf twine_${pkgver}_linux64.zip -C "${pkgname}_${pkgver}_linux64"
}

package() {
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/opt"
        cp -r "${pkgname}_${pkgver}_linux64" "$pkgdir/opt"
	cp twinejs.desktop "$pkgdir/usr/share/applications"
	cp logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/twinejs.svg"
	ln -s "/opt/${pkgname}_${pkgver}_linux64/twine" "$pkgdir/usr/bin/Twine"
}
