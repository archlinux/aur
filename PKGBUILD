# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

pkgname=oilshell
pkgver=0.7.pre8
pkgrel=1
pkgdesc='Oil, a new unix shell'
arch=('x86_64')
url='http://www.oilshell.org/'
depends=('readline')
license=('APACHE')
options=(!strip)
install=oilshell.install
source=("https://www.oilshell.org/download/oil-${pkgver}.tar.xz")
sha256sums=('296205fb0522137c6649a034758445b456270fda1e4028d99a254c19467310e0')

build() {
	cd "oil-$pkgver"
	./configure --prefix=/usr --with-readline
	make
}

package() {
	cd "oil-$pkgver"

    # the install script doesn't support DESTDIR
    install -Dm755 _bin/oil.ovm "$pkgdir/usr/bin/oil.ovm"
    ln -s /usr/bin/oil.ovm "$pkgdir/usr/bin/osh"
    ln -s /usr/bin/oil.ovm "$pkgdir/usr/bin/oshc"
}
