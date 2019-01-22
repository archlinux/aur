# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
# Contributor: Hugo Rodrigues <hugorodrigues at openmailbox dot com>

pkgname=xcursor-dmz
pkgver=0.4.5
pkgrel=1
pkgdesc="Style neutral, scalable cursor theme"
arch=('any')
url="https://packages.debian.org/sid/dmz-cursor-theme"
license=('MIT')
groups=('x11')
makedepends=('xorg-xcursorgen')
source=("http://cdn.debian.net/debian/pool/main/d/dmz-cursor-theme/dmz-cursor-theme_${pkgver}."{tar.xz,dsc}
        "LICENSE")
sha256sums=('b719a64ed9c51905743105e5a50b15492695929ab2d6fca2cea760d52ccd1f5c'
            'e214d75442fc040d53b74c108a798239dfffa641173475a07ea43bd7e0f56311'
            '40dfbfc2cbe54d70a3c9de047d4aa8e8c7ebb4f41a5b0290d4bb36e2a2a5326f')
validpkgkey=('4D0BE12F0E4776D8AACE9696E66C775AEBFE6C7D')

build() {
	
	cd $srcdir/dmz-cursor-theme-${pkgver}
	rm -r debian renderpngs.py

	cd DMZ-White/pngs
	./make.sh
	cd ..
	mv xcursors cursors
	rm -r dmz.svg index.theme pngs
	cd ..

	cd DMZ-Black/pngs
	./make.sh
	cd ..
	mv xcursors cursors
	rm -r dmz-aa.svg index.theme pngs
	cd ..



}

package() {
	install -dm755 "$pkgdir/usr/share/icons/"
	cp -R "$srcdir/dmz-cursor-theme-${pkgver}/DMZ-White" "$pkgdir/usr/share/icons/"
	cp -R "$srcdir/dmz-cursor-theme-${pkgver}/DMZ-Black" "$pkgdir/usr/share/icons/"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
