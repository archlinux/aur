# Maintainer: Sebastian Neef <aur AT gehaxelt DOT IN>
pkgbase=intelbacklight-git
pkgname=intelbacklight-git
pkgver=r3.4ec8dfd
pkgrel=1
pkgdesc="A tool that mimics the xbacklight functionality for intel_backlight."
arch=('any')
url="https://github.com/gehaxelt/C-Intelbacklight"
license=('MIT')
depends=('gcc')
makedepends=('git' 'bash')
install=intelbacklight-git.install
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::git+https://github.com/gehaxelt/C-Intelbacklight.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "$srcdir/$pkgname"
    gcc intelbacklight.c -o intelbacklight
}
package() {
	cd "$srcdir/$pkgname"
    install -D -m554 intelbacklight "${pkgdir}/usr/bin/intelbacklight"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
