# Maintainer: Daniel Barbosa <dbarbosa0 at gmail dot com>

pkgname=spiceopus
pkgver=3v0r407
pkgrel=1
pkgdesc="Spice Opus is a free general purpose circuit simulator specially suited for optimization loops"
arch=('x86_64')
url="http://www.spiceopus.si/"
license=(http://www.spiceopus.si/license.html)
depends=()
conflicts=()
source=(http://www.spiceopus.si/download/spice_opus"$pkgver"_linux_x86_64.tar.gz)
sha256sums=('3238984426e230be76ecec7296b342298c0e187d72f2d2426f79bc763f22aaa5')

OPUSHOME=/opt/$pkgname

package() {
	
	cd "$srcdir"/spice_opus"$pkgver"_linux_x86_64
	install -d "$pkgdir"$OPUSHOME
	cp -R * "$pkgdir"$OPUSHOME
	install -d "$pkgdir"/usr/local/bin/
        ln -s $OPUSHOME/bin/spiceopus.bin "$pkgdir"/usr/local/bin/spiceopus
        install -d "$pkgdir"/etc/profile.d/
echo "export OPUSHOME=$OPUSHOME
export SPICE_LIB_DIR=$OPUSHOME/lib/spiceopus
export SPICE_EXEC_DIR=$OPUSHOME/bin" > "$pkgdir"/etc/profile.d/$pkgname.sh	

  install -Dm644 "${startdir}/spiceopus.desktop" "${pkgdir}/usr/share/applications/spiceopus.desktop"
  install -Dm644 "${startdir}/spice_opus.png" "${pkgdir}/usr/share/pixmaps/spiceopus.png"
  install -Dm644 "${startdir}/spiceopus-cir.xml" "${pkgdir}/usr/share/mime/packages/spiceopus-cir.xml"

}

post_install(){
    xdg-mime install /usr/share/mime/packages/spiceopus-cir.xml
    update-mime-database /usr/share/mime
    xdg-mime default spiceopus.desktop application/spiceopus
}

post_remove(){
    xdg-mime uninstall /usr/share/mime/packages/spiceopus-cir.xml
}
