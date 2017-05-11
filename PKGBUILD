# Maintainer: Eshin Kunishima <ek at esh dot ink>
pkgname=cpustat
pkgver=1.1.0
pkgrel=1
pkgdesc="High Frequency Performance Measurements for Linux"
arch=('x86_64' 'i686')
url="https://github.com/uber-common/cpustat"
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/uber-common/cpustat/tar.gz/$pkgver")
sha256sums=('c3fc86c206ab4d6b2274d888638e59a05d4ef9bd7817581c781368d13f7440cc')

prepare() {
  cd "$pkgname-$pkgver"

  GOPATH="$srcdir" go get -v -x -d
}

build() {
  cd "$pkgname-$pkgver"

  GOPATH="$srcdir" go build -v -x
}

package() {
  cd "$pkgname-$pkgver"
  
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
