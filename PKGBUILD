# Contributor: Pavel Borzenkov <pavel@voidptr.ru>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=criu
pkgver=1.5.2
pkgrel=1
pkgdesc="Checkpoint/Restore in Userspace tool"
url="http://criu.org"
license=("GPL2")
arch=("x86_64")
source=("http://download.openvz.org/$pkgname/$pkgname-$pkgver.tar.bz2"
	      "makefiles.diff")
depends=("protobuf-c")
makedepends=("xmlto" "asciidoc")
options=("!buildflags")
changelog=${pkgname}.changelog
md5sums=('5288cb4148cf9631ea2ec1b5ec148f6d'
         '441e65c3eaed9eb7e1158b4837476a94')
sha1sums=('a45b104bf76f7932148613d3409b28b110e75cc2'
          '788e00452867f05de4b5983dab96645248418d91')
sha256sums=('e8226018ac6c4094d61a1c002543e2b2253b4041a8edb24d4c1eaa41ce5ab345'
            'a9443c6c45ccda0e6253b0d39f9576a8f6da95ae68f77b2995761a54d99a88ca')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < $srcdir/makefiles.diff
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

