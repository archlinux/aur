# Maintainer: Steffen Fritz <aur AT fritz DOT wtf>
# Packager: Steffen Fritz <aur AT fritz DOT wtf>
pkgname=pacaudit
pkgver=1.1.1
pkgrel=1
pkgdesc="This package audits installed packages against known vulnerabilities."
arch=('i686' 'x86_64')
url="https://github.com/steffenfritz/pacaudit"
license=('GPL3')
makedepends=('go')
options=('!strip')

sha256sums=('3230c7e77959b2a021033dd40dbeba17224177b326b3d6da7870ea255919a1b3')

source=("https://github.com/steffenfritz/pacaudit/archive/v$pkgver.tar.gz")


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
