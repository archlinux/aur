# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=libshairport
_developer='amejia1'
_version=1.2.1.20121215
_commithash='16395d8'
pkgver=${_version}
pkgrel=10
pkgdesc="emulates an AirPort Express"
arch=('x86_64')
url='https://github.com/amejia1/libshairport'
license=('GPL')
depends=('openssl' 'libao')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/amejia1/libshairport/tarball/$_commithash")
# from https://mirror.rosalab.ru/rosa/rosa2021.1/repository/SRPMS/contrib/release/,
# fork simply deleted on github, maybe it comes back
source=("$pkgname-$pkgver.tar.xz::https://archlinux32.andreasbaumann.cc/other/arch/libshairport-20120111.tar.xz"
        "libshairport-20120111-compilation.patch")
sha256sums=('89a4ff9da535a85c8ab35c25fcb0f24f2b6d9a01b32ec6c4bb2ce55ccb88aef0'
            'cdcf127fd6f317bf487a3aad2c7e1164e14b37fd5fb4d0b9d508317a969b29f7')

_srcfolder=$_developer-$pkgname-$_commithash

prepare() {
  cd libshairport-20120111

  patch -Np1 -i "$srcdir/libshairport-20120111-compilation.patch"

  autoreconf -vif
}

build() {
#  mv "$_srcfolder" "$pkgname-$pkgver"

#  cd "$pkgname-$pkgver"
  cd libshairport-20120111
  ./configure --prefix=/usr
  make
}

package() {
#  cd "$pkgname-$pkgver"
  cd libshairport-20120111
  make DESTDIR="$pkgdir" install
}
