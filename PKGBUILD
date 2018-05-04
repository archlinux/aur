# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Maintainer : David Phillips <dbphillipsnz (at at) gmail , com>

pkgname=aa3d
pkgver=1.0
pkgrel=5
pkgdesc="ASCII art stereogram generator"
arch=('i686' 'x86_64')
url="http://aa-project.sourceforge.net/aa3d"
license=('GPL2')
depends=('glibc')
source=("https://downloads.sourceforge.net/aa-project/$pkgname-$pkgver.tar.gz"
        "aa3d.string.header.patch")
sha512sums=('05548b6231aefe2f50dd5e61cb6ddd41b3ce4bf50263c19249ab9ecc466c633e7ff1fb743204ed712994b8bd96315e4eacd23a3e4dd3e8a049e0ffad5f74fa18'
            '79e1afb80a6fb61c27d63e999fca4d1a6ecab24d4f3ff3b52c74ccf790823af5b9b1e456035823c0ab2f7d0c4c376c5d436a1d8849a2e81f47aaa96776d55235')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -Np0 -i "${srcdir}"/aa3d.string.header.patch
	make clean
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/doc/${pkgname}/"
	install -m 644 pyramid logo README COPYING "${pkgdir}/usr/share/doc/${pkgname}/"
	install -m 755 -t "${pkgdir}/usr/bin/" aa3d
}
