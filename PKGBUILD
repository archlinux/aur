# Maintainer: Nicolas LLOBERA <nllobera@gmail.com>
pkgname="libsane-dsseries"
pkgver=1.0.5_1
pkgrel=1
pkgdesc="Brother SANE drivers for DSmobile 620"

arch=('x86_64')
url="http://support.brother.com/g/b/downloadend.aspx?c=fr&lang=fr&prod=ds620_all&os=128&dlid=dlf100976_000&flang=4&type3=566"
license=('GPL' 'custom:Brother')

depends=('gcc-libs-multilib')

install=libsane-dsseries.install

# liste des url des fichiers à télécharger et liste des noms de fichiers locaux
source=("http://download.brother.com/welcome/dlf100974/$pkgname-${pkgver/_/-}.$CARCH.rpm"
		"http://www.brother.com/agreement/English_sane/agree.html")
md5sums=('905610438d279cacf50de973a5f270cf'
		 'ccffb9a6f6d436b21be25b0241068981')

# Compile le programme et créé le dossier pkg
build() {
    echo "dsseries" > "$srcdir/dsseries.conf"  # create the dsseries.conf
}

package() {
	cp -r "$srcdir/etc" "$pkgdir"  # copy /etc
	cp -r "$srcdir/usr" "$pkgdir"  # copy /usr
	install -D -m644 "$srcdir/agree.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"  # install LICENSE.html
	install -D -m644 "$srcdir/dsseries.conf" "$pkgdir/etc/sane.d/dll.d/dsseries.conf"  # install dsseries.conf
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"  # rename lib64 to lib
	mv "$pkgdir/usr/local/lib64" "$pkgdir/usr/local/lib"  # rename lib64 to lib
	mv "$srcdir/lib/udev" "$pkgdir/usr/lib"  # copy /lib/udev to /usr/lib
	rm -r "$pkgdir/usr/local"  # remove /usr/local because it isn't really used at all in Arch
}
