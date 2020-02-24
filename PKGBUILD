# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
pkgname=i3keys
pkgver=0.0.11
pkgrel=1
pkgdesc='Lists used and unused keys in your i3wm or Sway config'
arch=('any')
url="https://github.com/RasmusLindroth/$pkgname"
license=('MIT')
makedepends=('go')
source=("https://github.com/RasmusLindroth/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('18a957aa4a8c6c8692e3108565856012ab9867a062ad2da9f8ec16c6de623050')

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
