# Maintainer: Edward Pacman <edward AT edward-p dot xyz>

pkgname=acpi-msi-ge62-git
pkgver=r17.eb7d8f3
pkgrel=1
pkgdesc="patched DSDT/SSDTs for MSI-GE62."
arch=('any')
url="https://github.com/edward-p/ACPI-MSI-GE62"
license=()
depends=()
makedepends=('git' 'acpica' 'cpio')
source=("${pkgname}::git+https://github.com/edward-p/ACPI-MSI-GE62.git")
install=$pkgname.install
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


build() {
        cd "$srcdir/$pkgname/src"
        make
}

package() {
        cd "$srcdir/$pkgname/src"
        make DESTDIR="$pkgdir/" install
}
