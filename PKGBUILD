# Contributor: Pavel Borzenkov <pavel@voidptr.ru>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=criu
pkgver=1.7
pkgrel=1
pkgdesc="A Checkpoint/Restore functionality for Linux in Userspace."
url="http://criu.org"
license=("GPL2")
arch=("x86_64")
source=("http://download.openvz.org/$pkgname/$pkgname-$pkgver.tar.bz2"
        "makefiles.diff")
depends=("protobuf-c")
makedepends=("xmlto" "asciidoc")
options=("!buildflags")
changelog=Changelog
md5sums=('317a2c303f445824c640d5665a40d778'
         'f1633bb3045bfe5920a7e870b5c02045')
sha1sums=('e92b964bfbe390516c26b58a899f2fa74cc7631c'
          '6686e8658314638e66b9f1cd632e14af487abd2e')
sha256sums=('977cf03d94415c2858581bb9894cfb90ac0c0b4b045e9bfa7c04c230aae01a21'
            'e6a6213b02149cfbb47f79cfb1948738bb1c749211d5acecc41d9527f5124483')

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

