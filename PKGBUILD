# Maintainer: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: YaYPIXXO <viggo@lekdorf.com>
pkgname=evillimiter-git
pkgver=1.5.0.r0.g46d2033
pkgrel=1
pkgdesc="Tool that monitors, analyzes and limits the bandwidth of devices on the local network without administrative access."
arch=('any')
url="https://github.com/bitbrute/evillimiter"
license=('MIT')
provides=('evillimiter')
depends=('python-colorama' 'python-netaddr' 'python-netifaces' 'python-tqdm'
         'python-scapy' 'python-terminaltables')
makedepends=('python-setuptools')
source=("git+https://github.com/bitbrute/evillimiter.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/evillimiter/"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
	cd "${srcdir}/evillimiter/"
	python setup.py build
}

package() {
	cd "${srcdir}/evillimiter/"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	# Fix LIBC issue
	ln -sf /usr/lib/libc.a "$pkgdir/usr/lib/liblibc.a"
}
