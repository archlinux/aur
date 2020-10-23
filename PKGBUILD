# Maintainer: Vresod <lukebinkofsky@gmail.com>
pkgname=advcpmv
pkgver=8.32
pkgrel=1
pkgdesc="Advanced Copy is a mod for the GNU cp and GNU mv tools which adds a progress bar and provides some info on what's going on"
arch=( "any" )
url="https://github.com/jarun/advcpmv"
license=("GPL3")
source=( "http://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz" "https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-0.8-8.32.patch" )
sha256sums=('4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa'
            'd39b493ccbd3a8423bd00fc5767e385b0588efca53ec9699f8b328715aa47368')
depends=( )
optdepends=( )
makedepends=( "xz" )

prepare() {
	tar xvJf "coreutils-8.32.tar.xz"
	cd coreutils-8.32
	mv ../advcpmv-0.8-8.32.patch .
	patch -p1 -i advcpmv-0.8-8.32.patch
	./configure
	cd ..
}

build() {
	cd coreutils-8.32
	make
	cd ..
}

package() {
	install -Dm644 "coreutils/src/cp" "$pkgdir"/usr/bin/advcp
	install -Dm644 "coreutils/src/mv" "$pkgdir"/usr/bin/advmv
}
