# Maintainer: a821
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-ps-git
pkgrel=1
pkgver=2026.02.03.r7.ge5cef26
pkgdesc="PostScript support for zathura"
arch=('x86_64')
url="https://pwmt.org/projects/zathura-ps"
license=('Zlib')
depends=('cairo' 'girara-git' 'glib2' 'libspectre' 'zathura-git')
makedepends=('git' 'meson' 'ninja')
conflicts=('zathura-ps')
provides=('zathura-ps')
source=("$pkgname::git+https://github.com/pwmt/zathura-ps.git#branch=develop")
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
