# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: solstiCe d'Hiver <solstice.dhiver@gmail.com>
pkgname=virt-v2v
pkgver=2.0.6
pkgrel=1
pkgdesc="Convert a guest image to use with KVM"
arch=(x86_64)
url="https://libguestfs.org/virt-v2v.1.html"
license=('GPL')
depends=('libguestfs' 'libosinfo' 'libnbd')
makedepends=('ocaml' 'ocaml-findlib')
optdepends=('mingw-w64-rhsrvany: for Windows based VM'
	'virtio-win: for windows based VM')
source=("https://download.libguestfs.org/virt-v2v/${pkgver:0:3}-stable/virt-v2v-${pkgver}.tar.gz" "virt-v2v.install")
install=virt-v2v.install

sha256sums=('e5eba9f7960340334100c06e1380bf84d0d730c53cdf587fefbfab7c889aca15'
            '6235d47396e8e193a80de17825fe337f18ab0bb6ffb4a61f204bea57e5a90f7d')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
