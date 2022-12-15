# Maintainer: Daniel Barbosa <dbarbosa0 at gmail dot com>

pkgname=spiceopus
pkgver=2v33r242
pkgrel=3
pkgdesc="Spice Opus is a free general purpose circuit simulator specially suited for optimization loops"
arch=('x86_64')
url="http://www.spiceopus.si/"
license=(GPL3)
depends=()
conflicts=()
source=(http://www.spiceopus.si/download/spice_opus233r242_linux_amd64.tar.gz)
sha256sums=('52d70f8f6878d6ce0d0e33cdb09a2501edbd5081e6739e2fc1c1246424578929')

OPUSHOME=/opt/$pkgname

package() {
	
	cd "$srcdir"/spice_opus233r242_linux_amd64_15.Apr.2021_09.29
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
