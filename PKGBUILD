# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Maintainer : David Phillips <dbphillipsnz (at at) gmail , com>

pkgname=aa3d
pkgver=1.0
pkgrel=4
pkgdesc="ASCII art stereogram generator"
arch=('i686' 'x86_64')
url="http://aa-project.sourceforge.net/aa3d"
license=('GPL2')
depends=('glibc')
source=("http://downloads.sourceforge.net/aa-project/$pkgname-$pkgver.tar.gz"
        "aa3d.string.header.patch")
sha512sums=('a5a98664f43b03cd8275432ba625729d88dc4c7da3668185e16c0068c0e29e90ac6fc3c3368c4f75e19b0372191bae68adb40066bc04fb5e1a85e7e3ae6c6802'
            '79e1afb80a6fb61c27d63e999fca4d1a6ecab24d4f3ff3b52c74ccf790823af5b9b1e456035823c0ab2f7d0c4c376c5d436a1d8849a2e81f47aaa96776d55235')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -Np0 -i $srcdir/aa3d.string.header.patch
	make clean
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -d $pkgdir/usr/bin
	install -d $pkgdir/usr/share/doc/$pkgname/
	install -m 644 pyramid logo README COPYING $pkgdir/usr/share/doc/$pkgname/
	install -m 755 -t $pkgdir/usr/bin/ aa3d
}
