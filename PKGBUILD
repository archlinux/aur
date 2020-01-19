# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
pkgname=i3keys
pkgver=0.0.8
pkgrel=1
pkgdesc='Lists used and unused keys in your i3wm config'
arch=('any')
url="https://github.com/RasmusLindroth/$pkgname"
license=('MIT')
makedepends=('go')
source=("https://github.com/RasmusLindroth/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('2f867f82c5ab2b468f717e0453829278bf043b093c28c7cfc9697ca4e93be3b9')

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
