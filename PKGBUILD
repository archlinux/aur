# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

pkgname=oilshell
pkgver=0.6.pre16
pkgrel=1
pkgdesc='Oil, a new unix shell'
arch=('x86_64')
url='http://www.oilshell.org/'
depends=('readline')
license=('APACHE')
options=(!strip)
source=("https://www.oilshell.org/download/oil-${pkgver}.tar.xz")
sha256sums=('ccc34f4e4723052d93018efd1bcbeb1c080f0af1cbfc5a9b4f50d0ea4ad0cf90')

build() {
	cd "oil-$pkgver"
	./configure --prefix=/usr --with-readline
	make
}

package() {
	cd "oil-$pkgver"

    # make install is faked...
    install -Dm755 _bin/oil.ovm "$pkgdir/usr/bin/oil.ovm"
    ln -s /usr/bin/oil.ovm "$pkgdir/usr/bin/osh"
    ln -s /usr/bin/oil.ovm "$pkgdir/usr/bin/oshc"
}
