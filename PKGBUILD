# Maintainer:Walter - "d2Nhc2Fub3ZhQGRpc3Jvb3Qub3JnCg=="
# indent = tab
# tab-size = 4

pkgname='pynetdicom-git'
_pkgname='pynetdicom'
pkgver=v2.1.1.r9.gdcd8f3c16
pkgrel=2
pkgdesc="A Python implementation of the DICOM networking protocol"
arch=('i686' 'x86_64')
url="https://github.com/pydicom/pynetdicom"
license=('GPL3')
depends=('python-pydicom' 'python')
makedepends=('python-setuptools' 'git' 'python-flit-core')
provides=('pynetdicom')
conflicts=('pynetdicom')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
