# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

pkgname=oilshell
pkgver=0.6.pre22
pkgrel=1
pkgdesc='Oil, a new unix shell'
arch=('x86_64')
url='http://www.oilshell.org/'
depends=('readline')
license=('APACHE')
options=(!strip)
source=("https://www.oilshell.org/download/oil-${pkgver}.tar.xz")
sha256sums=('8521542cefdb66f67cc46a115e8ec108b55e08f0ad18216e9a3f67a430f354cf')

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
