# Maintainer: Paragoumba <paragoumba@protonmail.com>
# Contributor: Parker Reed <parker.l.reed@gmail.com>

pkgname=joycond-git
pkgver=r110.f9a6691
pkgrel=1
pkgdesc='Userspace daemon to combine joy-cons from the hid-joycon kernel driver'
arch=('x86_64' 'aarch64')
url='https://github.com/DanielOgorchock/joycond'
license=('GPL3')
depends=('libevdev')
optdepends=('hid-nintendo-dkms: provides driver for pre-5.16 kernels')
makedepends=('cmake' 'git')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
install=$pkgname.install
source=('git+https://github.com/DanielOgorchock/joycond.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/joycond"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/joycond"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/joycond"
	make DESTDIR="$pkgdir/" install
	mv "$pkgdir/lib" "$pkgdir/usr/"
}
