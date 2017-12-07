# Maintainer: Darshit Shah <darnir@gmail.com>
#
pkgname=vgrep
pkgver=2.0.1
pkgrel=1
epoch=1
pkgdesc="Reimpementation of the ancient cgvg perl scripts"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=( 'go' )
checkdepends=( 'go-lint-git' )
url="https://github.com/vrothberg/vgrep"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vrothberg/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('3081c6ffa56e0e46ca2bb8727f542999')

prepare() {
  mkdir $srcdir/{bin,pkg,src}
  mv $srcdir/${pkgname}-${pkgver}/ $srcdir/src/
  cd $srcdir/src/$pkgname-$pkgver
}

check() {
  cd $srcdir/src/$pkgname-$pkgver
  make check
}

build() {
  cd $srcdir/src/$pkgname-$pkgver
  export GOPATH=$srcdir
  go get ./...
  make release
}

package() {
  cd "$srcdir/src/$pkgname-$pkgver"

  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -t "${pkgdir}/usr/bin/" build/vgrep
}

# vim: ts=2:sw=2:et
