# Maintainer: That One Seong <ThatOneSeong@protonmail.com>
# Contributor: Parker Reed <parker.l.reed@gmail.com>

pkgname=joycond-autopair-git
_name=joycond
pkgver=0.1.0.autopair.r3.gea55b5a
pkgrel=1
pkgdesc='Userspace daemon to combine joy-cons from the hid-nintendo kernel driver. Modified to autopair Pro Controllers.'
arch=('x86_64' 'aarch64')
url='https://github.com/DanielOgorchock/joycond'
license=('GPL3')
depends=('libevdev')
optdepends=('hid-nintendo-dkms: provides driver for pre-5.16 kernels')
makedepends=('cmake' 'git')
provides=('joycond-git')
conflicts=('joycond-git')
install=$pkgname.install
source=('git+https://github.com/SeongGino/joycond.git')
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
