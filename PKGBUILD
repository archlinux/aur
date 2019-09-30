# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Dmitri Goutnik <dg@syrec.org>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=gox
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple, no-frills tool for Go cross compilation"
arch=('i686' 'x86_64')
url="https://github.com/mitchellh/${pkgname}"
license=('MPL2')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('25aab55a4ba75653931be2a2b95e29216b54bd8fecc7931bd416efe49a388229')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  go mod download
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -trimpath -ldflags "-extldflags $LDFLAGS"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
