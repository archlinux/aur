# Maintainer: Steffen Fritz <aur AT fritz DOT wtf>
# Packager: Steffen Fritz <aur AT fritz DOT wtf>
pkgname=pacaudit
pkgver=1.1.0
pkgrel=1
pkgdesc="This package audits installed packages against known vulnerabilities. Use after pacman -Syu."
arch=('i686' 'x86_64')
url="https://github.com/steffenfritz/pacaudit"
license=('GPL3')
makedepends=('go')
options=('!strip')

sha256sums=('1f2725033f274d7dc4a50ffb2287b5e12acb4e4093a64c82cd09671265822ef0')

source=("https://github.com/steffenfritz/pacaudit/archive/v$pkgver.tar.gz")


prepare(){
  mkdir -p src/github.com/steffenfritz
  ln -rTsf "${pkgname}-${pkgver}" src/github.com/steffenfritz/pacaudit
}

build() {
  cd "$pkgname-$pkgver"
  go build  -o pacaudit -ldflags "-s -w" -buildmode=pie
}

package() {
    install -Dm755 "$srcdir"/pacaudit-${pkgver}/pacaudit "$pkgdir/usr/bin/pacaudit"
    install -Dm644 "$srcdir"/pacaudit-$pkgver/pacaudit.1 "${pkgdir}/usr/share/man/man1/pacaudit.1"
}
