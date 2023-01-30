# Maintainer: Lev Levitsky <levlev<at>mail.ru>
pkgname=regtools-git
pkgver=1.0.0.r0.3068563
pkgrel=1
pkgdesc="Tools that integrate DNA-seq and RNA-seq data to help interpret mutations in a regulatory and splicing context"
arch=('any')
url="https://github.com/griffithlab/regtools"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/griffithlab/regtools.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    mkdir build
    cd build
	cmake ..
	make
}

package() {
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    cd "$srcdir/${pkgname%-git}"
    install LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
	cd build
    install -d "$pkgdir/usr/bin"
	install "${pkgname%-git}" "$pkgdir/usr/bin/"
}
