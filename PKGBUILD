# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
pkgname=i3keys
pkgver=0.0.6
pkgrel=1
pkgdesc='Lists used and unused keys in your i3wm config'
arch=('any')
url="https://github.com/RasmusLindroth/$pkgname"
license=('MIT')
makedepends=('go')
source=("https://github.com/RasmusLindroth/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('1ad8fff2ef3d903c1d9bd64169227e350b2036f1b1a6b06ad96dd76ec0b1e433')

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
