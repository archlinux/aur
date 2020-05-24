# Maintainer: Nicolas <nicolas@bananeatomic.fr>
pkgname="libsane-dsseries"
pkgver=1.0.5_1
pkgrel=2
pkgdesc="Brother SANE drivers for DSmobile 620"

arch=('x86_64')
url="http://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=ds620_all"
license=('GPL' 'custom:Brother')

depends=('gcc-libs-multilib')

install=libsane-dsseries.install

# liste des url des fichiers à télécharger et liste des noms de fichiers locaux
source=("http://download.brother.com/welcome/dlf100974/$pkgname-${pkgver/_/-}.x86_64.rpm")
md5sums=('905610438d279cacf50de973a5f270cf')

# Compile le programme et créé le dossier pkg
build() {
    echo "dsseries" > "$srcdir/dsseries.conf"  # create the dsseries.conf
}

package() {
	cp -r "$srcdir/etc" "$pkgdir"  # copy /etc
	cp -r "$srcdir/usr" "$pkgdir"  # copy /usr
	install -D -m644 "$srcdir/dsseries.conf" "$pkgdir/etc/sane.d/dll.d/dsseries.conf"  # install dsseries.conf
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"  # rename lib64 to lib
	mv "$pkgdir/usr/local/lib64" "$pkgdir/usr/local/lib"  # rename lib64 to lib
	mv "$srcdir/lib/udev" "$pkgdir/usr/lib"  # copy /lib/udev to /usr/lib
	rm -r "$pkgdir/usr/local"  # remove /usr/local because it isn't really used at all in Arch
}
