# Maintainer: Paragoumba <paragoumba@protonmail.com>
# Contributor: Parker Reed <parker.l.reed@gmail.com>

pkgname=joycond-git
_name=joycond
pkgver=v0.1.0.r51.gf9a6691
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
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_name"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir/" install
  mv "$pkgdir/lib" "$pkgdir/usr/"
}
