# Maintainer: Ingo Fabbri <der_ulmen@yahoo.de>

pkgname=grobi
pkgver=0.6.0
pkgrel=0
pkgdesc="Automatically configure monitors/outputs for Xorg via RANDR"
arch=("i686" "x86_64")
license=('BSD 2-Clause "Simplified"')
url="https://github.com/fd0/grobi"
makedepends=('go>=1.11')
provides=('grobi')
conflicts=("grobi-git")
depends=("glibc")
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('875fa2781c1060a0eea434900c2de3bcb882e0c6dd50ff6d4548014632913a3ac4117e10222ff92bc3095d377d863774f2cb09ebc007dcedac3f04c1b0f39482')

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
