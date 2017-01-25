# Maintainer: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=pdfsizeopt-git
pkgver=r263.cba29b4
pkgrel=2
pkgdesc="PDF file size optimizer"
arch=(any)
url="https://github.com/pts/pdfsizeopt"
license=('GPL2')
groups=()
depends=("python2>=2.4" "ghostscript>=8.61" "sam2p" "tif22pnm")
provides=(pdfsizeopt)
conflicts=(pdfsizeopt-svn)
replaces=(pdfsizeopt-svn)
makedepends=('git')
optdepends=("multivalent-pdf-tools: to optimise cross reference table and object serialisation [use --use-multivalent=true]"
            "pngout: to optimise the size of PNG parts [use --use-jbig2=true]"
            "jbig2enc: to manage JBIG2 parts [use --use-pngout=true]")
source=("git+https://github.com/pts/pdfsizeopt"
	"archpackage.patch")
pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/archpackage.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./mksingle.sh
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m 755 $srcdir/pdfsizeopt/pdfsizeopt.single $pkgdir/usr/bin/pdfsizeopt
}

md5sums=('SKIP'
         '6ccd8d71b9833b30ae027aad6d81302b')
