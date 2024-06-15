# Maintainer: a821
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-poppler-git
pkgver=0.3.2.r4.g79b4e32
pkgrel=1
pkgdesc="PDF support for zathura (poppler backend)"
arch=('x86_64')
url="https://pwmt.org/projects/zathura-pdf-poppler"
license=('Zlib')
depends=('desktop-file-utils' 'zathura-git' 'poppler-glib')
makedepends=('git' 'meson' 'ninja')
conflicts=('zathura-pdf-poppler')
provides=('zathura-pdf-poppler')
source=("$pkgname::git+https://github.com/pwmt/zathura-pdf-poppler.git#branch=develop")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./g'
}

build() {
  cd "$pkgname"
  arch-meson build
  ninja -C build
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir/" ninja -C build install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
