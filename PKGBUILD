# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
pkgname=oilshell
pkgver=0.5.0
pkgrel=1
pkgdesc="Oil is a new unix shell"
arch=('x86_64')
url="http://www.oilshell.org/"
optdepends=('readline: for interactive features')
license=('APACHE')
options=(!strip)
source=("https://www.oilshell.org/download/oil-${pkgver}.tar.xz")
sha256sums=('dc18bbed27dc3c18925d4614bbbdd576063fef186c44f1ecf20cd00b613eec0f')

build() {
	cd "oil-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "oil-$pkgver"

    # make install is faked...
    install -Dm755 _bin/oil.ovm "$pkgdir/usr/bin/oil.ovm"
    ln -s /usr/bin/oil.ovm "$pkgdir/usr/bin/osh"
    ln -s /usr/bin/oil.ovm "$pkgdir/usr/bin/oshc"
}
