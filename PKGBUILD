# Maintainer: Lev Levitsky <levlev<at>mail.ru>
pkgname=regtools-git
pkgver=0.6.0.r0.9221a19
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

    # Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    mkdir build
    cd build
	cmake ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
    install -d "$pkgdir/usr/bin"
	install "${pkgname%-git}" "$pkgdir/usr/bin/"
}
