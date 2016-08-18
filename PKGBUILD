# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=flint1
pkgver=1.6
pkgrel=1
epoch=
pkgdesc="Fast Library for Number Theory 1.x series"
arch=('x86_64')
url="http://www.flintlib.org/"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.flintlib.org/flint-$pkgver.tgz"
        "$pkgname-$pkgver.patch")
noextract=()
md5sums=('72ae4b64e1e7acb03847e8e565bbe432'
         'b91de4a92585c44c30c28974e5acca32')
validpgpkeys=()

prepare() {
	cd "flint-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "flint-$pkgver"
  source flint_env
	make PREFIX="/usr/" library
}

check() {
	cd "flint-$pkgver"
	make -k check
}

package() {
  install -Dm644 ${srcdir}/flint-${pkgver}/libflint.so \
    ${pkgdir}/usr/lib/libflint.so
  # cd "flint-$pkgver"
  # make DESTDIR="$pkgdir/" install
}
