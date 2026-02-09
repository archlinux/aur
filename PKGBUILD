# Maintainer: a821
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-djvu-git
pkgrel=1
pkgver=2026.02.03.r1.g8a134d1
pkgdesc="DjVu support for zathura"
arch=('x86_64')
url="https://pwmt.org/projects/zathura-djvu"
license=('custom')
depends=('cairo' 'girara-git' 'glib2' 'djvulibre' 'zathura-git')
makedepends=('git' 'meson' 'ninja')
conflicts=('zathura-djvu')
provides=('zathura-djvu')
source=("$pkgname::git+https://github.com/pwmt/zathura-djvu.git#branch=develop")
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
