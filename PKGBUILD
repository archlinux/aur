# Maintainer: Mathieu Clabaut <mathieu.clabaut@gmail.com>
pkgname=docbook2odf
pkgver=0.244
pkgrel=2
pkgdesc="toolkit that automaticaly converts DocBook to OASIS OpenDocument"
arch=(i686 x86_64)
url="http://open.comsultia.com/docbook2odf/"
license=('GPL2')
depends=('libxslt' 'perl-xml-libxslt' 'zip' 'perl-archive-zip')
provides=('docbook2odf')
source=(http://open.comsultia.com/docbook2odf/dwn/${pkgname}-${pkgver}.tar.gz)
md5sums=('3b285dc4d6298beb12818a350776751f')

package() {
	# create directories
	install -d $pkgdir/usr/{bin,share/{applications,docbook2odf/examples,man/man1}}
	
	# copy files
	cd "$srcdir/$pkgname-${pkgver}"
	install -m 0644 bindings/desktop/*.desktop "$pkgdir/usr/share/applications"
	install -m 0644 examples/* "$pkgdir/usr/share/docbook2odf/examples"
	install -m 0644 docs/docbook2odf.1 "$pkgdir/usr/share/man/man1/docbook2odf.1"
	install -m 0755 utils/docbook2odf "$pkgdir/usr/bin/docbook2odf"

	cd "$srcdir/$pkgname-${pkgver}/xsl"
	find . -type d -exec install -d {,${pkgdir}/usr/share/docbook2odf/xsl/}{} \;
	find . -type f -exec install -D -m 644 {,${pkgdir}/usr/share/docbook2odf/xsl/}{} \;
	}
