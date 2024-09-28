# Maintainer: a821
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-djvu-git
pkgrel=1
pkgver=0.2.10.r1.g2a60a41
pkgdesc="DjVu support for zathura"
arch=('x86_64')
url="https://pwmt.org/projects/zathura-djvu"
license=('custom')
depends=('zathura-git' 'djvulibre' 'desktop-file-utils')
makedepends=('git' 'meson' 'ninja' 'appstream-glib')
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
  arch-meson build
  ninja -C build
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir/" ninja -C build install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
