# Maintainer: Repentinus <aur at repentinus dot eu>
# SPDX-License-Identifier: CC0-1.0

pkgname='python-h5py-docs'
pkgver=3.2.1
pkgrel=1
pkgdesc='Set of HTML documentation for python-h5py'
arch=('any')
url='https://docs.h5py.org/'
license=('BSD')
options=('docs' '!strip')
source=("$pkgname-$pkgver.zip::https://docs.h5py.org/_/downloads/en/$pkgver/htmlzip/")
makedepends=('links')

# Calculated by the PKGBUILD maintainer as upstream does not provide any
sha256sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/share/doc/python-h5py/html/"

	cp -r "./h5py-$pkgver/"* "$pkgdir/usr/share/doc/python-h5py/html/"

	links -dump "./h5py-$pkgver/index.html" | sed -nE '/^\s*Copyright \(c\) 2008 Andrew Collette and contributors/,/DAMAGE\.$/ {s/^( )?(.*)$/\2/p}' > LICENCE
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENCE
}
