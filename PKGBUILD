# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
pkgname=jedit-pkgbuild 
pkgver=4.0.0
pkgrel=6
pkgdesc='jEdit PKGBUILD edit mode'
arch=('any')
url='https://gitlab.com/radio_rogal/jedit-pkgbuild'
license=('GPL')
depends=('jedit' 'xmlstarlet')
makedepends=('coreutils' 'tar')
install=jedit-pkgbuild.install
source=(https://gitlab.com/radio_rogal/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2)
noextract=(${pkgname}-v${pkgver}.tar.bz2)
md5sums=('c800c1363137b035208320ad3dd35f31')
sha256sums=('b9aa5ba8a75a26c6f99ac0b04fbbc745b2fc5fdda2d7a097633437658cbbd53e')

prepare() {
	cd "$srcdir"

	tar -xf ${pkgname}-v${pkgver}.tar.bz2 --strip-components=1
}

package() {
	#  catalog.dtd is required to edit the edit mode catalog (XML)
	install -d "$pkgdir"/usr/share/$pkgname
	install -m 644 "$srcdir"/catalog.dtd "$pkgdir"/usr/share/$pkgname/catalog.dtd
	ln -s /usr/share/java/jedit/modes/catalog "$pkgdir"/usr/share/$pkgname/catalog.xml

	# edit mode file
	install -d "$pkgdir"/usr/share/java/jedit/modes
	install -m 644 "$srcdir"/pkgbuild.xml "$pkgdir"/usr/share/java/jedit/modes/pkgbuild.xml
}
