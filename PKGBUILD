# Maintainer: Vresod <lukebinkofsky@gmail.com>
pkgname=advcpmv
pkgver=9.0
pkgrel=3
pkgdesc="Advanced Copy is a mod for the GNU cp and GNU mv tools which adds a progress bar and provides some info on what's going on"
arch=( "any" )
url="https://github.com/jarun/advcpmv"
license=("GPL3")
source=( "http://ftp.gnu.org/gnu/coreutils/coreutils-$pkgver.tar.xz" "https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-0.9-$pkgver.patch" "mv.1.gz" "cp.1.gz" )
sha256sums=('ce30acdf4a41bc5bb30dd955e9eaa75fa216b4e3deb08889ed32433c7b3b97ce'
            'b41f03d01c6e51db2ab491758bee594034cc02a815c87f4c19a4fafdfdfc9bd6'
            '6ab6916b1ea86be2c669c8c99dbd2b08848f19cd719b68aaf27a9d460ca2dd83'
            '82054540db3ca04f62d95ef4a45ef79809c2c94df5bbfc2458a4970e9a862409')
depends=( )
optdepends=( )
makedepends=( "xz" )

prepare() {
	tar xvJf "coreutils-$pkgver.tar.xz"
	cd coreutils-$pkgver
	mv ../advcpmv-0.9-$pkgver.patch .
	patch -p1 -i advcpmv-0.9-$pkgver.patch
	./configure
	cd ..
}

build() {
	cd coreutils-$pkgver
	make
	cd ..
	
}

package() {
	install -Dm755 "coreutils-$pkgver/src/cp"  "$pkgdir"/usr/bin/advcp
	install -Dm755 "coreutils-$pkgver/src/mv"  "$pkgdir"/usr/bin/advmv
	install -Dm644 "mv.1.gz"                   "$pkgdir"/usr/share/man/man1/advmv.1.gz
	install -Dm644 "cp.1.gz"                   "$pkgdir"/usr/share/man/man1/advcp.1.gz
}
