# Maintainer: Eshin Kunishima <ek at esh dot ink>
pkgname=cpustat
pkgver=20160427
pkgrel=1
pkgdesc="High Frequency Performance Measurements for Linux"
arch=('x86_64' 'i686')
url="https://github.com/uber-common/cpustat"
license=('MIT')
depends=('linux')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
_gourl=github.com/uber-common/cpustat

build() {
  GOPATH="$srcdir" go get -v -x ${_gourl}/...
}

check() {
  GOPATH="$srcdir" go test -v -x ${_gourl}/...
}

package() {
  install -p -Dm755 "$srcdir/bin/cpustat" "$pkgdir/usr/sbin/cpustat"
  install -p -Dm644 "$srcdir/src/$_gourl/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
