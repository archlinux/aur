# Maintainer: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=pdfsizeopt
pkgver=20171011b
_pkgver=2017-10-11b
pkgrel=1
pkgdesc="PDF file size optimizer"
arch=(any)
url="https://github.com/pts/pdfsizeopt"
license=('GPL2')
groups=()
depends=("python2>=2.4" "ghostscript>=8.61" "sam2p" "tif22pnm" "advancecomp")
provides=(pdfsizeopt)
conflicts=(pdfsizeopt-git)
replaces=(pdfsizeopt-git)
makedepends=('git')
optdepends=("multivalent-pdf-tools: to optimise cross reference table and object serialisation [use --use-multivalent=true]"
            "pngout: to optimise the size of PNG parts [use --use-jbig2=true]"
            "jbig2enc: to manage JBIG2 parts [use --use-pngout=true]")
source=("https://github.com/pts/${pkgname}/archive/${_pkgver}.tar.gz")
md5sums=('SKIP')

build() {
	cd "$srcdir/${pkgname}-${_pkgver}"
	sed -i 's/\/usr\/bin\/python/\02.7/g' mksingle.py
	./mksingle.py
}

package() {
	cd "$srcdir/${pkgname}-${_pkgver}"
	install -D -m 755 "$srcdir/${pkgname}-${_pkgver}"/pdfsizeopt.single $pkgdir/usr/bin/pdfsizeopt
}
