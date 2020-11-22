# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Alexey Pavlov <alexpux@gmail.com>

pkgname=pystring
pkgver=1.1.3+7+g281419d
_commit=281419de2f91f9e0f2df6acddfea3b06a43436be
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="C++ functions matching the interface and behavior of python string methods with std::string"
url="https://github.com/imageworks/pystring"
license=('BSD')
depends=('gcc-libs')
source=("$url/archive/$_commit.tar.gz"
        "makefile.patch")
sha512sums=('SKIP'
            'dc5f94cc062023d138ab9cab92081323c576b9e03d853b615981f2bc89dd5de96bd9a19c420bbd23eac5248b7949b337fe858622aae0751fbc0b16f59db77fdd')

prepare() {
  cd $pkgname-$_commit
  patch -p1 -i "$srcdir/makefile.patch"
}

build() {
  cd $pkgname-$_commit
  make
}

package() {
  cd $pkgname-$_commit
  make DESTDIR="$pkgdir" install

  install -dm0755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$_commit/LICENSE" \
          -t "$pkgdir/usr/share/licenses/$pkgname"
}
