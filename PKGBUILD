# Maintainer: a821
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-ps-git
pkgrel=1
pkgver=0.2.7.r2.g0d28473
pkgdesc="PostScript support for zathura"
arch=('x86_64')
url="https://pwmt.org/projects/zathura-ps"
license=('custom')
depends=('zathura-git' 'libspectre')
makedepends=('git' 'meson' 'ninja')
conflicts=('zathura-ps')
provides=('zathura-ps')
source=("$pkgname::git+https://git.pwmt.org/pwmt/zathura-ps.git#branch=develop")
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
