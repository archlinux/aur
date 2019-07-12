# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
pkgname=i3keys
pkgver=0.0.7
pkgrel=1
pkgdesc='Lists used and unused keys in your i3wm config'
arch=('any')
url="https://github.com/RasmusLindroth/$pkgname"
license=('MIT')
makedepends=('go')
source=("https://github.com/RasmusLindroth/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('42285df91919eea1f3112e5c246cf26444aeda2207f359b89f20f5b5289f2520')

build() {
  cd $pkgname-$pkgver
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
