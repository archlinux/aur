# Maintainer: Daniel Cafe <dcafe@unb.br>
pkgname=uvm
pkgver=3.1
pkgrel=1
pkgdesc="Accellera Universal Verification Methodology"
arch=(any)
url="https://www.accellera.org/downloads/standards/uvm"
license=('Apache-2.0')
source=(https://github.com/accellera-official/uvm-core/archive/refs/tags/2020.3.1.tar.gz
	uvm.sh
	uvm_reg_model.svh.patch)
noextract=()
sha256sums=('f55bdbc02cc500d4a2f41b31bad127653289eb2073f806ce156fb82662b362b8'
		SKIP
		SKIP)

build() {
	echo "Extracting source files"
	cd ${srcdir}
	tar -xf 2020.3.1.tar.gz
	patch uvm-core-2020.3.1/src/reg/uvm_reg_model.svh -i uvm_reg_model.svh.patch
}

package() {
	mkdir -p $pkgdir/usr/src/uvm
	mkdir -p $pkgdir/usr/share/doc
#	mkdir -p $pkgdir/usr/share/licenses/uvm
#	mkdir -p $pkgdir/etc/profile.d
	mv "$srcdir/uvm-core-2020.3.1/docs" "$pkgdir/usr/share/doc/uvm"
	mv "$srcdir/uvm-core-2020.3.1/src"  "$pkgdir/usr/src/uvm"
	install -Dm644 "$srcdir/uvm-core-2020.3.1/LICENSE.txt" \
			"$pkgdir/usr/share/licenses/uvm/LICENSE"
	install -Dm644 uvm.sh $pkgdir/etc/profile.d/uvm.sh

}
