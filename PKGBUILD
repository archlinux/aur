# overall information
pkgname=akku
pkgdesc='Language package manager for Scheme'
url='https://akkuscm.org/'
license=('GPL-3.0-only')
arch=('any')

# version-specific information
pkgver=1.1.0
pkgrel=6

# as per https://gitlab.com/akkuscm/akku/-/blob/master/README.md
depends=('git' 'curl' 'guile>=2.2')
makedepends=('pkg-config' 'make')

# newer versions can be found at https://gitlab.com/akkuscm/akku/-/releases
source=('https://gitlab.com/akkuscm/akku/uploads/819fd1f988c6af5e7df0dfa70aa3d3fe/akku-1.1.0.tar.gz'
        'define-values.patch')
sha256sums=('12decdc8a2caba0f67dfcd57b65e4643037757e86da576408d41a5c487552c08'
            '8e2b13449f142f83a7b619cdd6faab30cd52ea630fdd8910a0383e2af16176ed')
options=(!strip)

build() {
	cd "$pkgname-$pkgver"
	patch -p1 -i ../define-values.patch
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
