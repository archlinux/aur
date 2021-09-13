# Maintainer: Matei Cotocel <mcotocel at outlook dot com>
pkgname=quiet-gtk-git
pkgver=r130.9bcdd55
pkgrel=1
pkgdesc='Quiet GTK theme'
url='https://github.com/quiettheme/gtk'
license=('MIT')
arch=('any')
makedepends=('npm')
source=("$pkgname::git://github.com/quiettheme/gtk.git")
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
