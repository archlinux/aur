# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
pkgname=gocredits
pkgver=0.2.0
pkgrel=1
pkgdesc='gocredits creates CREDITS file from LICENSE files of dependencies'
arch=('any')
url="https://github.com/Songmu/$pkgname"
license=('MIT')
makedepends=('go')
source=("https://github.com/Songmu/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3e79e688679a94bdf3e74b326eb120a03577ac582fc0af6f020fba8706de36dd')

build() {
  cd $pkgname-$pkgver
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname ./cmd/$pkgname
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
