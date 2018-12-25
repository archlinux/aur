# Maintainer: Steffen Fritz <aur AT fritz DOT wtf>
pkgname=pacaudit
pkgver=0.4.0
pkgrel=2
pkgdesc="This package audits installed packages against known vulnerabilities. Use after pacman -Syu."
arch=('i686' 'x86_64')
url="https://github.com/steffenfritz/pacaudit"
license=('GPL3')
makedepends=('go')
options=('!strip')

validpgpkeys=('7328F6E376924E4EE266381D3D9C808E038A615C')
sha256sums=('9512deb8b29e09aa2312661e5d8c5c0c331e2975110582f407e8482c7d471c4c'
'a9482a2c999f6ca5da43ae206153f4a38e9607f3953443408f99349437ed2f0c')

source=("https://github.com/steffenfritz/pacaudit/archive/v$pkgver.tar.gz" "https://fritz.wtf/v$pkgver.tar.gz.asc")



prepare(){
  mkdir -p src/github.com/steffenfritz
  ln -rTsf "${pkgname}-${pkgver}" src/github.com/steffenfritz/pacaudit
}

build() {
  export GOPATH="${srcdir}"
  cd src/github.com/steffenfritz/pacaudit
  go build -o pacaudit -ldflags "-s -w" -buildmode=pie
}

package() {
    install -Dm755 "$srcdir"/pacaudit-${pkgver}/pacaudit "$pkgdir/usr/bin/pacaudit"
    install -Dm644 "$srcdir"/pacaudit-$pkgver/pacaudit.1 "${pkgdir}/usr/share/man/man1/pacaudit.1"
}
