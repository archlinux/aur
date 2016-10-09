# Maintainer: Grigoriy Ogilko  <grigruss@ya.ru>


pkgname=libreoffice-langpack-ru
pkgver=0.1.0_1
pkgrel=1
pkgdesc="Russian language pack for interface of the LibreOffice 5.2.2"
arch=('any')
url="http://www.libreoffice.org"
license=('LGPL')
categories=('office')


depends=('libreoffice-fresh>=5.2.2' 'cpio')
makedepends=('rpm2cpio>=20040702')

source=("http://download.documentfoundation.org/libreoffice/stable/5.2.2/rpm/x86_64/LibreOffice_5.2.2_Linux_x86-64_rpm_langpack_ru.tar.gz")
sha1sums=('a4a3b9ae80fad6f3e203b574258c13110f2d6e6b')

package() {
	cd "$srcdir"
	tar -xf LibreOffice_5.2.2_Linux_x86-64_rpm_langpack_ru.tar.gz
	echo "cd LibreOffice_5.2.2_Linux_x86-64_rpm_langpack_ru"
	cd ./LibreOffice*ru
	echo "cd RPMS"
	cd RPMS
	echo "Start cycle..."
	for file in *.rpm; do
		rpm2cpio.pl $file > $file.cpio;
		echo $file.cpio;
		cpio -id < $file.cpio;
	done
	echo "Unpack done!"
	cd opt/libre*
	mkdir ../../../../libreoffice
	cp -r * ../../../../libreoffice/
	cd ../../../../
	rm -r LibreOffice*
	mkdir ../pkg/libreoffice-langpack-ru/usr
	mkdir ../pkg/libreoffice-langpack-ru/usr/lib
	cp -r libreoffice ../pkg/libreoffice-langpack-ru/usr/lib
}
