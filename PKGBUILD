# Maintainer: Ingo Fabbri <der_ulmen@yahoo.de>

pkgname=grobi
pkgver=0.5.2
pkgrel=1
pkgdesc="Automatically configure monitors/outputs for Xorg via RANDR"
arch=("i686" "x86_64")
license=('BSD 2-Clause "Simplified"')
url="https://github.com/fd0/grobi"
makedepends=('go>=1.11')
provides=('grobi')
conflicts=("grobi-git")
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f61281e09f349b09448be3aaf25de4aa8e11a9735514c579345ed49a59c1ee29e0e4dc17fccd09e63e34e08499e28bdacf996ff78247f6e186c6a1351fe825da')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 grobi "$pkgdir/usr/bin/grobi"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 doc/grobi.service "$pkgdir/usr/lib/systemd/user/grobi.service"
  install -Dm644 contrib/grobi.bash "$pkgdir/usr/share/bash-completion/completions/grobi"
}

build(){
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  go build .
}