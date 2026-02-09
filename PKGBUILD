# Maintainer: a821
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-poppler-git
pkgver=2026.02.03.r1.g971e0ca
pkgrel=1
pkgdesc="PDF support for zathura (poppler backend)"
arch=('x86_64')
url="https://pwmt.org/projects/zathura-pdf-poppler"
license=('Zlib')
depends=('girara-git' 'glib2' 'zathura-git' 'poppler-glib')
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
  arch-meson build -Dtests=disabled
  ninja -C build
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir/" ninja -C build install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
