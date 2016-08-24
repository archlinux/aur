# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Contributor: B. Lee <darklin20 /at/ gmail.com>
# Contributor: jerry73204 <jerry73204 /at/ gmail.com>
pkgname=gle-graphics
pkgver=4.2.5
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
pkgdesc='Graphics scripting language for creating graphs, plots, diagrams and figures'
url='http://www.gle-graphics.org/'
license=('BSD' 'GPL')
depends=('libtiff' 'libjpeg' 'ghostscript' 'poppler-glib')
makedepends=('qt4' 'openssl' 'zlib' 'ghostscript' 'texlive-bin' 'texlive-core' 'texlive-latexextra')
optdepends=('texlive: latex labels in GLE scripts' 'qt4: qgle')
source=(http://prdownloads.sourceforge.net/glx/gle-graphics-${pkgver}f-src.tar.gz)
md5sums=('c28c17aa8448822667604631ec7c8629')

prepare() {
	cd $pkgname-$pkgver

	#sed -i -e 's:GLE_INSTALL_DATA=$prefix/share/$PACKAGE_TARNAME/$GLE_VERSION:GLE_INSTALL_DATA=$prefix/share/$PACKAGE_TARNAME:' configure
}

build() {
	cd $pkgname-$pkgver

	CPPFLAGS+=' -O2' ./configure --prefix=/usr --with-qt --with-jpeg \
		--with-png --with-tiff --with-z --with-manip --with-libgle \
		--with-rpath=no --with-extrafonts --with-x

	make -j1
	make -j1 doc
}

package() {
	cd $pkgname-$pkgver

	make -j1 DESTDIR="$pkgdir" install

	install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 platform/autopackage/gle.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/gle.png"
	install -D -m644 platform/autopackage/gle.xml "$pkgdir/usr/share/mime/packages/gle.xml"
	install -D -m644 platform/autopackage/gle.desktop "$pkgdir/usr/share/applications/gle.desktop"
}
