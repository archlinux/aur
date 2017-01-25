# Maintainer: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=pdfsizeopt-git
pkgver=r271.6f1d901
pkgrel=1
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
source=("git+https://github.com/pts/pdfsizeopt")
pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./mksingle.sh
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m 755 $srcdir/pdfsizeopt/pdfsizeopt.single $pkgdir/usr/bin/pdfsizeopt
}

md5sums=('SKIP')
