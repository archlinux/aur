# Maintainer: Steffen Fritz <aur AT fritz DOT wtf>
# Packager: Steffen Fritz <aur AT fritz DOT wtf>
pkgname=pacaudit
pkgver=1.2.0
pkgrel=1
pkgdesc="This package audits installed packages against known vulnerabilities."
arch=('i686' 'x86_64')
url="https://github.com/steffenfritz/pacaudit"
license=('GPL3')
makedepends=('go')
options=('!strip')

sha256sums=('3aedbef361bb9bbe01cfa89464b75237c2446aa5c538f0996f4c9fb5ad393f52')

source=("https://github.com/steffenfritz/pacaudit/releases/latest/download/$pkgname-$pkgver.tar.gz")

prepare(){
  mkdir -p src/github.com/steffenfritz
  ln -rTsf "${pkgname}-${pkgver}" src/github.com/steffenfritz/pacaudit
}

build() {
  cd "$pkgname-$pkgver"
  go build  -o pacaudit -ldflags "-w" -buildmode=pie
}

package() {
    install -Dm755 "$srcdir"/pacaudit-${pkgver}/pacaudit "$pkgdir/usr/bin/pacaudit"
    install -Dm755 "$srcdir"/pacaudit-${pkgver}/pacaudit.sh "$pkgdir/usr/bin/pacaudit.sh"
    install -Dm755 "$srcdir"/pacaudit-${pkgver}/pacaudit-pre.hook "$pkgdir/usr/share/libalpm/hooks/pacaudit-pre.hook"
    install -Dm644 "$srcdir"/pacaudit-$pkgver/pacaudit.1 "${pkgdir}/usr/share/man/man1/pacaudit.1"
}
