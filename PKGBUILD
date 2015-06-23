# Maintainer: aksr <aksr at t-com dot me>
pkgname=sccs
pkgver=5.07
pkgrel=1
epoch=
pkgdesc="The UNIX Source Code Control System actively maintained/enhanced."
arch=('i686' 'x86_64')
url="http://sccs.sourceforge.net/"
license=('CDDL' 'GPL')
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2"
        "http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-patch01"
        "http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-patch02")
noextract=()
options=()
md5sums=('1beb4e12f629ffc0bada3c6f5a287bb4'
         'fc70dc27aea52a760218c780eb20ec85'
         '71d77265bba808af847d25d2c6934a73')
sha1sums=('91447ad6b24207ffcb0c4df58ba671b1eb9c5983'
          '8713b1e336ba4f2cc04d1af8b51ddccdcfc21152'
          'dbfabb127fa1287ea60d88e7d1d8cd219b788b87')
sha256sums=('e0d04d99ff9158870437b018e4205da2778d716034b70468b0fecc67c597de19'
            '3d4a23c056c0b8cb1dcbd06f7122b104a813e81d4c5969472475a644e89d7813'
            '6ebb58beaed2436f8645c473548177d19010ec2c4719c406b0aa464a1725a580')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/sccs"
  patch -p1 -i "$srcdir/$pkgname-$pkgver-patch01"
  sed -i '3s@.*@--- sccs/sccs/cmd/src/admin.c@' ../../$pkgname-$pkgver-patch02
  sed -i '4s@.*@+++ sccs/sccs/cmd/src/admin.c@' ../../$pkgname-$pkgver-patch02
  patch -p1 -i "$srcdir/$pkgname-$pkgver-patch02"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

