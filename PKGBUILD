# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Darshit Shah <darnir@gmail.com>

pkgname=vgrep
pkgver=2.3.1
pkgrel=1
pkgdesc="Reimpementation of the ancient cgvg perl scripts"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('go')
url="https://github.com/vrothberg/vgrep"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vrothberg/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ecea69eb91a0c07471d89ff08bdc8b6cb2eb6b62e9b689dd74a9ef5a1df9f99e')

prepare() {
  mkdir $srcdir/{bin,pkg,src}
  mv $srcdir/${pkgname}-${pkgver}/ $srcdir/src/
  cd $srcdir/src/$pkgname-$pkgver
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
