# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=idevicerestore
pkgver=1.0.0
pkgrel=3
pkgdesc='Restore/upgrade firmware of iOS devices'
arch=('x86_64')
url='https://www.libimobiledevice.org'
license=('LGPL3')
depends=('curl' 'libimobiledevice' 'libplist' 'libirecovery' 'libzip' 'openssl' 'zlib')
conflicts=('idevicerestore-git') # https://aur.archlinux.org/packages/idevicerestore-git/#comment-759041
source=("https://github.com/libimobiledevice/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2"
        '0001-configure.ac-check-for-pthreads.patch')
sha256sums=('32712e86315397fd2e8999e77a2d2f790c67f6b4aa50d4d1c64cb2c4609836f7'
            'fdf51e7f7105af048902fd18f950b6ed7c3f845fc80a225ba43709e9e48a42d5')

prepare() {
  cd "$pkgname-$pkgver"

  for p in "${srcdir}"/*.patch; do
    patch -Np1 -i "${p}"
  done
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
