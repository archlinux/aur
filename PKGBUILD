# Maintainer: a821
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=girara-git
pkgver=0.3.8.r1.g34d204e
pkgrel=1
pkgdesc="User interface library focused on simplicity and minimalism"
arch=('x86_64')
url="https://pwmt.org/projects/girara"
license=('custom')
depends=('gtk3' 'glib2' 'json-c' 'pango')
makedepends=('git' 'meson' 'ninja' 'doxygen' 'check')
conflicts=('girara')
provides=('girara')
source=("${pkgname}::git+https://git.pwmt.org/pwmt/girara.git#branch=develop")
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

check() {
  ninja -C "$pkgname/build" test
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir/" ninja -C build install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
