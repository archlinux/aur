# Maintainer: Philipp Schaffrath <aur at philipp dot schaffrath dot email>

pkgname=phocus-gtk-theme-git
pkgver=r192.945ad39
pkgrel=1
pkgdesc='gtk theme based on the phocus colors'
url='https://github.com/phocus/gtk'
license=('MIT')
arch=('any')
makedepends=('npm')
conflicts=('phocus-gtk-theme')
replaces=('phocus-gtk-theme')
source=("$pkgname::git+https://github.com/phocus/gtk.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "$pkgname"
    make
    make DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}