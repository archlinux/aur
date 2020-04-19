# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Darshit Shah <darnir@gmail.com>

pkgname=vgrep
pkgver=2.2.0
pkgrel=1
pkgdesc="Reimpementation of the ancient cgvg perl scripts"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=( 'go' )
url="https://github.com/vrothberg/vgrep"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vrothberg/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0d6b91e0241dec468402d28b4481fad0a3fea4f6e9f20523d31c30ef7ac3d577')

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
