# Maintainer: Jonas Hahnfeld <hahnjo@hahnjo.de>

pkgname=dynconf
pkgver=1.1.2
pkgrel=1
pkgdesc="A small program to apply recipes to configuration files"
arch=('x86_64')
url="https://github.com/hahnjo/dynconf"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')
validpgpkeys=('5F0FF9606A4BE87F553A03B691C9C33D2C61ACDB')
source=("git+https://github.com/hahnjo/dynconf#tag=v${pkgver}?signed")
sha256sums=('SKIP')

build(){
  cd "$pkgname"
  export EXTRA_GOFLAGS="-buildmode=pie -trimpath -ldflags \"-linkmode=external -extldflags ${LDFLAGS}\""
  make
}

package() {
  cd "${pkgname}"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 scripts/completion.bash "$pkgdir"/usr/share/bash-completion/completions/$pkgname
}
